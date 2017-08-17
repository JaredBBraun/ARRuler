using UnityEngine;
using System.Collections;

public class DragObject : MonoBehaviour
{
    private Camera mainCam;
    private GameObject go;
    [SerializeField]
    float _horizontallimit = 10f, _verticallimit = 10f, dragSpeed = 0.1f;

    Transform cachedTransform;
    Vector3 startingPos;


    // Use this for initialization
    void Start()
    {
        //referencia transform
        cachedTransform = transform;

        //salva a posicao inicial
        startingPos = cachedTransform.position;

        mainCam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Vector2 deltaPosition = Input.GetTouch(0).deltaPosition;
            switch (Input.GetTouch(0).phase)
            {
                case TouchPhase.Began:
                    break;

                case TouchPhase.Moved:
                    RaycastHit hit = new RaycastHit();
                    for (int i = 0; i < Input.touchCount; ++i)
                    {
                        Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                        if (Physics.Raycast(ray, out hit))
                        {
                            if (hit.transform.gameObject.CompareTag ("glass"))
                            {
                                go = hit.transform.gameObject;
                                DragObj(deltaPosition, go);
                                go = null;
                            }
                        }

                    }
                        
                    break;

                case TouchPhase.Ended:
                    break;
            }
        }
    }

    void DragObj(Vector2 deltaPos, GameObject go)
    {
        go.transform.position = new Vector3(Mathf.Lerp((deltaPos.x * dragSpeed) + go.transform.position.x, startingPos.x - _horizontallimit, startingPos.x + _horizontallimit),
                                                           
                                                           
            (go.transform.position.y),

            Mathf.Clamp((deltaPos.y * dragSpeed) + go.transform.position.z, startingPos.z - _verticallimit, startingPos.z + _verticallimit) );
       
    }
}