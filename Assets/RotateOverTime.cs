using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateOverTime : MonoBehaviour
{

    public float rotationSpeed = 1.0f;

    private void FixedUpdate()
    {
        transform.Rotate(Vector3.up,rotationSpeed * Time.fixedDeltaTime);
    }
}
