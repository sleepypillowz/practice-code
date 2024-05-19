using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[System.Serializable]
public class EnemyEvent : UnityEvent
{
}
public class LogicScript : MonoBehaviour
{
    public EnemyEvent onEnemyHit;

    void Start()
    {
        if (onEnemyHit == null)
        {
            onEnemyHit = new EnemyEvent();
        }

        onEnemyHit.AddListener(reduceHealth);
    }
    public void reduceHealth()
    {
        Debug.Log("Reduced Enemy Health");
    }
}
