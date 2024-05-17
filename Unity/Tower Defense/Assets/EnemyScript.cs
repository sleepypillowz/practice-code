using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class EnemyScript : MonoBehaviour
{
    [SerializeField] private LogicScript logic;
    public int ProjectileLayer = 3;
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
        if (collision.gameObject.layer == ProjectileLayer)
        {
            logic.onEnemyHit.Invoke();
        }
        
    }
}
