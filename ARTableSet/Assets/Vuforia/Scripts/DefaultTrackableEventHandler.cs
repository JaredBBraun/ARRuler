/*==============================================================================
Copyright (c) 2010-2014 Qualcomm Connected Experiences, Inc.
All Rights Reserved.
Confidential and Proprietary - Protected under copyright and other laws.
==============================================================================*/

using UnityEngine;
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
            PICTURE,
            PLACING,
            GLASS
        }
        public TextMeshProUGUI tm;
        public STATE state = STATE.PICTURE;
        public Camera mainCam;
        public GameObject SpherePrefab;
        public Renderer quad;
        public Renderer bgquad;

        GameObject go;
        int x = 0;
        

        #region PRIVATE_MEMBER_VARIABLES

        private TrackableBehaviour mTrackableBehaviour;
        private bool takeHiResShot = true;
        private int resWidth = 1920;
        private int resHeight = 1080;

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

            tm.text = "Target Found";
            state = STATE.PLACING;
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
        }

        #endregion // PRIVATE_METHODS

        private void Update()
        {
            if (state == STATE.PLACING)
            {
                tm.text = "Tap Your Table to Place Glass";
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
                                }

                                

                               
                                go.transform.SetParent(GameObject.Find("ImageTarget").gameObject.transform);

                                x++;
                                go.tag = "glass";
                                go.name = "Ball " + x.ToString();
                                //Debug.Log(go.name + " Spawned");
                                go.transform.localScale = new Vector3(go.transform.localScale.x * 3.5f,
                                    go.transform.localScale.y * 3.5f,
                                    go.transform.localScale.z * 3.5f);

                                
                                go.AddComponent<DragObject>();
                                //go.AddComponent<UIDragObject>();
                                //go.AddComponent<ExampleDragDropItem>();
                                var PLANE = hit.transform.gameObject;
                            }

                            if (hit.transform.gameObject.tag == "glass")
                            {
                                Debug.Log("moving glass");
                               
                                go = hit.transform.gameObject;
                                go.AddComponent<DragObject>();
                            }
                        }
                        
                                               
                    }



                }
            }


            if (state == STATE.PICTURE)
            {
                tm.text = "Touch Screen to Take Picture";
                if (Input.touchCount > 0)
                {
                    if (takeHiResShot)
                    {
                        quad.material.mainTexture = bgquad.material.mainTexture;

                        takeHiResShot = false;
                        state = STATE.IDLE;
                    }

                }
            }
            if (state == STATE.IDLE)
            {
                tm.text = "Make Your Camera Look at Your Coupon";
            }
        }

        


    }
}
