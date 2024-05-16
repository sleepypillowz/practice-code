using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeMiddleScript : MonoBehaviour
{

    public LogicScript logic;

    public int BirdLayer = 3;

    // Start is called before the first frame update
    void Start()
    {
        logic = GameObject.FindGameObjectWithTag("Logic").GetComponent<LogicScript>();
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Debug.Log("bird passed through trigger add score");
        if (collision.gameObject.layer == BirdLayer)
        {
            logic.AddScore(1);
        }
        
    }
}
