using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeMiddleScript : MonoBehaviour
{

    [SerializeField] private LogicScript logic;

    public int PlayerLayer = 3;

    // Start is called before the first frame update
    void Start()
    {
        logic = GameObject.FindGameObjectWithTag("Logic").GetComponent<LogicScript>();
        if (logic == null)
        {
            Debug.LogError("LogicScript not found on GameObject with tag 'Logic'.");
        }
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Debug.Log("Player passed through trigger add score");
        if (collision.gameObject.layer == PlayerLayer)
        {
            logic.onPlayerPassedThroughPipe.Invoke();
        }
        
    }
}
