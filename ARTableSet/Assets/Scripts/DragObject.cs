using UnityEngine;
using System.Collections;

public class DragObject : MonoBehaviour
{
    private Camera mainCam;
    private GameObject go;
    private bool touched = false;


    Vector3 newPosition;


    // Use this for initialization
    void Start()
    {
        Input.multiTouchEnabled = false;
        //referencia transform
        newPosition = new Vector3(transform.position.x, transform.position.y, transform.position.z);



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
                case TouchPhase.Moved:

                    RaycastHit hit = new RaycastHit();
                    for (int i = 0; i < Input.touchCount; ++i)
                    {

                        Ray ray = mainCam.ScreenPointToRay(Input.GetTouch(i).position);
                        //Debug.Log("ray: " + ray.ToString());
                        if (Physics.Raycast(ray, out hit))
                        {
                            if (hit.transform.gameObject.CompareTag("glass"))
                            {
                               
                                //Debug.Log(hit.transform.gameObject.name + " Touched");
                                go = this.gameObject;
                                //hit.transform.localScale = new Vector3(.3f, .3f, .3f);
                                //if (hit.transform.localScale.x > 1.832268f || hit.transform.localScale.x == 0.8672039)
                                //{
                                //    Destroy(hit.transform.gameObject);
                                //}
                                
                                hit.transform.gameObject.GetComponent<Renderer>().material.color = Color.green;
                                touched = true;
                                if (touched == true)
                                {
                                    hit.transform.gameObject.GetComponent<Renderer>().material.color = Color.white;
                                }

                                if (Input.touchCount > 0 && Input.touchCount < 2)
                                {
                                    newPosition = new Vector3(hit.point.x, transform.position.y, hit.point.z);
                                    transform.position = newPosition;
                                }
                                   
                                else
                                {
                                    transform.position = new Vector3(this.transform.position.x, this.transform.position.y, this.transform.position.z);
                                }


                            }

                        }



                    }

                    break;

                case TouchPhase.Stationary:


                    break;

                case TouchPhase.Ended:
                    touched = false;

                    //go.transform.gameObject.GetComponent<Renderer>().material.color = Color.white;
                    Destroy(this);
                    break;
            }
        }
    }


}