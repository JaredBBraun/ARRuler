/*==============================================================================
Copyright (c) 2010-2014 Qualcomm Connected Experiences, Inc.
All Rights Reserved.
Confidential and Proprietary - Protected under copyright and other laws.
==============================================================================*/

using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Vuforia
{
    /// <summary>
    /// A custom handler that implements the ITrackableEventHandler interface.
    /// </summary>
    public class DefaultTrackableEventHandler : MonoBehaviour, ITrackableEventHandler
    {
        [System.Serializable]
        public enum STATE
        {
            IDLE,
            WAITING_FOR_NO_TOUCH,
            CONNECT_CAMERA_TO_REFL,
            PLACING,
            SELECT_TO_MOVE,
            MOVING,
            DELETING,
            GLASS
        }
        public TextMeshProUGUI tm;
        public STATE state = STATE.CONNECT_CAMERA_TO_REFL;
        public Camera mainCam;
        public GameObject SpherePrefab;
        public Renderer quad;
        public Material glassMtl;
        public Renderer bgquad;

        public GameObject AddButton;
        public Sprite AddActive;
        public Sprite AddInactive;
        public GameObject DeleteButton;
        public Sprite DeleteActive;
        public Sprite DeleteInactive;
        public GameObject MoveButton;
        public Sprite MoveActive;
        public Sprite MoveInactive;
        GameObject movingObj = null;

        public GameObject CheeseBoard;
        bool CheeseBoardHasBeenPlaced = false;

        GameObject go;
        int x = 0;
        

        #region PRIVATE_MEMBER_VARIABLES

        private TrackableBehaviour mTrackableBehaviour;
        private bool takeHiResShot = true;
        private int resWidth = 1920;
        private int resHeight = 1080;

        public bool TrackingHasBeenFound = false;

        #endregion // PRIVATE_MEMBER_VARIABLES



        #region UNTIY_MONOBEHAVIOUR_METHODS

        void Start()
        {
            Input.multiTouchEnabled = false;

            mTrackableBehaviour = GetComponent<TrackableBehaviour>();
            if (mTrackableBehaviour)
            {
                mTrackableBehaviour.RegisterTrackableEventHandler(this);
            }
        }

        #endregion // UNTIY_MONOBEHAVIOUR_METHODS



        #region PUBLIC_METHODS

        void SetButtonActive (GameObject button)
        {
            if (button == AddButton)
            {
                AddButton.GetComponent<Button>().image.sprite = AddActive;
            }
            else
                AddButton.GetComponent<Button>().image.sprite = AddInactive;
            if (button == MoveButton)
            {
                MoveButton.GetComponent<Button>().image.sprite = MoveActive;
            }
            else
                MoveButton.GetComponent<Button>().image.sprite = MoveInactive;
            if (button == DeleteButton)
            {
                DeleteButton.GetComponent<Button>().image.sprite = DeleteActive;
            }
            else
                DeleteButton.GetComponent<Button>().image.sprite = DeleteInactive;
        }
        public void OnAddGlass()
        {
            Debug.Log("Add Glass");
            SetButtonActive(AddButton);
            state = STATE.PLACING;
        }

        public void OnDeleteGlass()
        {
            Debug.Log("Delete Glass");
            SetButtonActive(DeleteButton);
            state = STATE.DELETING;
        }

        public void OnMoveGlass()
        {
            Debug.Log("Move Glass");
            SetButtonActive(MoveButton);
            state = STATE.SELECT_TO_MOVE;
        }

        /// <summary>
        /// Implementation of the ITrackableEventHandler function called when the
        /// tracking state changes.
        /// </summary>
        public void OnTrackableStateChanged(
                                        TrackableBehaviour.Status previousStatus,
                                        TrackableBehaviour.Status newStatus)
        {
            if (newStatus == TrackableBehaviour.Status.DETECTED ||
                newStatus == TrackableBehaviour.Status.TRACKED ||
                newStatus == TrackableBehaviour.Status.EXTENDED_TRACKED)
            {
                OnTrackingFound();
            }
            else
            {
                OnTrackingLost();
            }
        }

        #endregion // PUBLIC_METHODS



        #region PRIVATE_METHODS


        private void OnTrackingFound()
        {
            #region default found
            Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
            Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);

            // Enable rendering:
            foreach (Renderer component in rendererComponents)
            {
                component.enabled = true;
            }

            // Enable colliders:
            foreach (Collider component in colliderComponents)
            {
                component.enabled = true;
            }

            Debug.Log("Trackable " + mTrackableBehaviour.TrackableName + " found");

            #endregion

            TrackingHasBeenFound = true;

            if (state == STATE.IDLE)
            {
                tm.text = "Target Found";
                state = STATE.PLACING;
            }

        }


        private void OnTrackingLost()
        {
            #region default lost
            Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
            Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);

            // Disable rendering:
            foreach (Renderer component in rendererComponents)
            {
                component.enabled = false;
            }

            // Disable colliders:
            foreach (Collider component in colliderComponents)
            {
                component.enabled = false;
            }

            Debug.Log("Trackable " + mTrackableBehaviour.TrackableName + " lost");
            #endregion

            tm.text = "Target Lost";
            //state = STATE.IDLE;

            TrackingHasBeenFound = false ;
        }

        #endregion // PRIVATE_METHODS

        private void Update()
        {
            switch (state)
            {
                case STATE.DELETING:
                    {
                        tm.text = "Tap Glass To Remove";
                        RaycastHit hit = new RaycastHit();
                        for (int i = 0; i < Input.touchCount; ++i)
                        {
                            if (Input.GetTouch(i).phase == TouchPhase.Began)
                            {
                                Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                                if (Physics.Raycast(ray, out hit))
                                {
                                    Debug.Log("Touch hit \"" + hit.transform.name + "\"");
                                    if (hit.transform.gameObject.tag == "glass")
                                    {
                                        Debug.Log("deleting glass");

                                        go = hit.transform.gameObject;
                                        Destroy(go);

                                        state = STATE.WAITING_FOR_NO_TOUCH;
                                    }
                                }
                            }
                        }
                    }
                    break;

                case STATE.SELECT_TO_MOVE:
                    {
                        tm.text = "Tap and Drag Glass To Move";
                        movingObj = null;
                        RaycastHit hit = new RaycastHit();
                        for (int i = 0; i < Input.touchCount; ++i)
                        {
                            if (Input.GetTouch(i).phase == TouchPhase.Began)
                            {
                                Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                                if (Physics.Raycast(ray, out hit))
                                {
                                    Debug.Log("Touch hit \"" + hit.transform.name + "\"");
                                    if (hit.transform.gameObject.tag == "glass")
                                    {
                                        movingObj = hit.transform.gameObject;

                                        state = STATE.MOVING;
                                    }
                                }
                            }
                        }
                    }
                    break;

                case STATE.MOVING:
                    {
                        if (movingObj == null)
                            state = STATE.SELECT_TO_MOVE;

                        tm.text = "Drag Glass To Move";

                        if(Input.touchCount == 0)
                        {
                            state = STATE.SELECT_TO_MOVE;
                        }
                        else
                        {
                            for (int i = 0; i < Input.touchCount; ++i)
                            {
                                Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                                RaycastHit[] hits = Physics.RaycastAll(ray);
                                if (hits.Length > 0)
                                {
                                    for (int j = 0; j < hits.Length; j++)
                                    {
                                        Debug.Log("Touch hit \"" + hits[j].transform.name + "\"");
                                        if (hits[j].transform.gameObject.name == "Plane")
                                        {
                                            Debug.Log("moving glass");

                                            movingObj.transform.position = hits[j].point;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    break;

                case STATE.PLACING:
                    {
                        tm.text = "Tap Screen to Place Glass";
                        RaycastHit hit = new RaycastHit();
                        for (int i = 0; i < Input.touchCount; ++i)
                        {

                            // Construct a ray from the current touch coordinates
                            Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                            if (Physics.Raycast(ray, out hit))
                            {
                                if (Input.GetTouch(i).phase == TouchPhase.Began)
                                {
                                    //hit.transform.gameObject.SendMessage("OnMouseDown");
                                    if (hit.transform.gameObject.name == "Plane")
                                    {

                                        if (Input.touchCount > 0 && Input.touchCount < 2)
                                        {
                                            go = Instantiate(SpherePrefab,
                                            new Vector3(hit.point.x, hit.point.y, hit.point.z),
                                            Quaternion.identity) as GameObject;
                                            Debug.Log("adding game obj \"" + go.name + "\"");
                                        }

                                        SetButtonActive(MoveButton);

                                        go.transform.SetParent(GameObject.Find("ImageTarget").gameObject.transform);

                                        x++;
                                        go.tag = "glass";
                                        go.name = "Ball " + x.ToString();
                                        //Debug.Log(go.name + " Spawned");
                                        //go.transform.localScale = new Vector3(go.transform.localScale.x * 3.5f,
                                        //    go.transform.localScale.y * 3.5f,
                                        //    go.transform.localScale.z * 3.5f);
                                        go.transform.localScale = new Vector3(5f, 5f, 5f);

                                        go.AddComponent<DragObject>();
                                        //go.AddComponent<UIDragObject>();
                                        //go.AddComponent<ExampleDragDropItem>();

                                        if (!CheeseBoardHasBeenPlaced)
                                        {
                                            GameObject cbObj = Instantiate(CheeseBoard);
                                            cbObj.transform.SetParent(GameObject.Find("ImageTarget").gameObject.transform);
                                            cbObj.tag = "glass";
                                            cbObj.name = "Cheeseboard " + x.ToString();
                                            //Debug.Log(go.name + " Spawned");
                                            //go.transform.localScale = new Vector3(go.transform.localScale.x * 3.5f,
                                            //    go.transform.localScale.y * 3.5f,
                                            //    go.transform.localScale.z * 3.5f);
                                            cbObj.transform.localPosition = new Vector3(0, 0, 0.75f);
                                            cbObj.transform.localScale = new Vector3(1f, 1f,1f);
                                            CheeseBoardHasBeenPlaced = true;
                                        }
                                        var PLANE = hit.transform.gameObject;
                                    }

                                    SetButtonActive(MoveButton);

                                    state = STATE.SELECT_TO_MOVE;
                                    //if (hit.transform.gameObject.tag == "glass")
                                    //{
                                    //    Debug.Log("moving glass");

                                    //    go = hit.transform.gameObject;
                                    //    go.AddComponent<DragObject>();
                                    //}
                                }


                            }



                        }
                    }
                    break;

                case STATE.CONNECT_CAMERA_TO_REFL:
                    {
                        Image.PIXEL_FORMAT mPixelFormat = Image.PIXEL_FORMAT.RGB888;
                        if (CameraDevice.Instance.SetFrameFormat(mPixelFormat, true))
                        {
                            Debug.Log("Successfully registered pixel format " + mPixelFormat.ToString());

                        }
                        else
                        {
                            Debug.LogError(
                                "\nFailed to register pixel format: " + mPixelFormat.ToString() +
                                "\nThe format may be unsupported by your device." +
                                "\nConsider using a different pixel format.\n");

                            mPixelFormat = Image.PIXEL_FORMAT.RGB565;
                            if (CameraDevice.Instance.SetFrameFormat(mPixelFormat, true))
                            {
                                Debug.Log("Successfully registered pixel format " + mPixelFormat.ToString());

                            }
                            else
                            {
                                Debug.Log("2ND!!");
                                Debug.LogError(
                                    "\nFailed to register pixel format: " + mPixelFormat.ToString() +
                                    "\nThe format may be unsupported by your device." +
                                    "\nConsider using a different pixel format.\n");

                            }
                        }

                        Vuforia.Image image = CameraDevice.Instance.GetCameraImage(mPixelFormat);
                        if (image != null)
                        {
                            int origWid = image.Width; //original width
                            int origHgt = image.Height; //original height

                            int newWid = origHgt;//swap width with height
                            int newHgt = origWid;//swap height with width
                            Debug.Log("*** W " + origWid + " H " + origHgt);
                        }
                        else
                            Debug.Log("No IMAGE");
                        //quad.material.mainTexture = bgquad.material.mainTexture;
                        quad.material.SetTexture("_MatcapRimRefl", (Texture2D)VuforiaRenderer.Instance.VideoBackgroundTexture); // bgquad.material.mainTexture);
                        quad.material.SetTextureScale("_MatcapRimRefl", new Vector2(0.70262f, 0.93586f));
                        //quad.material.SetTexture("_MatcapRimRefl", Instantiate(bgquad.material.mainTexture) as Texture2D);
                        glassMtl.SetTexture("_MatcapRimRefl", (Texture2D)VuforiaRenderer.Instance.VideoBackgroundTexture); // bgquad.material.mainTexture);
                        glassMtl.SetTextureScale("_MatcapRimRefl", new Vector2(0.70262f, 0.93586f));
                        //glassMtl.SetTexture("_MatcapRimRefl", Instantiate(bgquad.material.mainTexture) as Texture2D);

                        Debug.Log("Texture size w " + VuforiaRenderer.Instance.VideoBackgroundTexture.width + " h " + VuforiaRenderer.Instance.VideoBackgroundTexture.height);
                        Debug.Log("Quad Size    w " + quad.material.GetTexture("_MatcapRimRefl").texelSize.x + " h " + quad.material.GetTexture("_MatcapRimRefl").texelSize.y);
                        takeHiResShot = false;
                        state = STATE.IDLE;
                    }
                    break;

                case STATE.IDLE:
                    {
                        tm.text = "Aim Your Camera at Your Coupon On Your Table";

                        if (TrackingHasBeenFound)
                        {
                            SetButtonActive(AddButton);
                            state = STATE.PLACING;
                            //state = STATE.WAITING_FOR_NO_TOUCH;
                        }
                    }
                    break;

                case STATE.WAITING_FOR_NO_TOUCH:
                    {
                        if (Input.touchCount == 0)
                        {
                            SetButtonActive(MoveButton);
                            state = STATE.SELECT_TO_MOVE;
                        }
                    }
                    break;
            }
        }
    }
}
