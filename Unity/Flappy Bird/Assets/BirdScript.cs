using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

public class BirdScript : MonoBehaviour
{
    public Rigidbody2D myRigidbody;
    public float flapStrength;
    public LogicScript logic;
    public bool birdIsAlive = true;
    public float screenMaxY = 16;
    public float screenMinY = -16;

    // Start is called before the first frame update
    void Start()    
    {
        logic = GameObject.FindGameObjectWithTag("Logic").GetComponent<LogicScript>();
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Space) && birdIsAlive) 
        {
            Debug.Log("player pressed space");
            myRigidbody.velocity = Vector2.up * flapStrength;
        }

        if (transform.position.y < screenMinY || transform.position.y > screenMaxY)
        {
            Debug.Log("player went out of bounds");
            logic.GameOver();
            birdIsAlive = false;
            Destroy(gameObject);
        }
    }
    private void OnCollisionEnter2D(Collision2D collision)
    {
        Debug.Log("player hit the pipes");
        logic.GameOver();
        birdIsAlive = false;
        Destroy(gameObject);
  
    }
}
