using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

public class PlayerScript : MonoBehaviour
{
    public Rigidbody2D myRigidbody;
    public float flapStrength;
    [SerializeField] private LogicScript logic;
    public bool birdIsAlive = true;
    public float screenMaxY = 16;
    public float screenMinY = -16;

    // Start is called before the first frame update
    void Start()
    {
        logic = GameObject.FindGameObjectWithTag("Logic").GetComponent<LogicScript>();
        if (logic == null)
        {
            Debug.LogError("LogicScript not found on GameObject with tag 'Logic'.");
        }
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Space) && birdIsAlive) 
        {
            // Debug.Log("player pressed space");
            myRigidbody.velocity = Vector2.up * flapStrength;
        }

        if (transform.position.y < screenMinY || transform.position.y > screenMaxY)
        {
            Debug.Log("Player went out of bounds");
            PlayerDied();
        }
    }
    private void OnCollisionEnter2D(Collision2D collision)
    {
        Debug.Log("Player hit the pipe");
        PlayerDied();
    }

    private void PlayerDied()
    {
        if (birdIsAlive)
        {
            Debug.Log("Player died");
            birdIsAlive = false;
            logic.onPlayerDied.Invoke();
            Destroy(gameObject);
        }
    }
}
