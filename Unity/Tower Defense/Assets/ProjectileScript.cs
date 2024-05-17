using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public float speed = 20;
    public float deadZone = 10;

    private void Update()
    {
        // Move the projectile
        transform.Translate(Vector2.right * speed * Time.deltaTime);

        if (transform.position.x > deadZone)
        {
            // Debug.Log("Projectile Deleted");
            Destroy(gameObject);

        }

    }

}
