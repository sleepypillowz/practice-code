using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Turret : MonoBehaviour
{
    private float timer = 0;
    public GameObject projectile;
    public Transform firePoint;
    public float fireInterval = 1; // Time in seconds between each shot
    

    void Update()
    {
        if (timer < fireInterval)
        {
            timer = timer + Time.deltaTime;
        }
        else
        {
            Shoot();
            timer = 0;
        }
    }

    void Shoot()
    {
        Debug.Log("Shoot");
        Instantiate(projectile, firePoint.position, firePoint.rotation);
    }
}
