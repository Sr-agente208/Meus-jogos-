using UnityEngine;

namespace MundoTorajo
{
    [RequireComponent(typeof(Rigidbody2D))]
    public class PlayerController : MonoBehaviour
    {
        [SerializeField] private float speed = 4f;
        private Rigidbody2D body;
        private Vector2 input;

        private void Awake() => body = GetComponent<Rigidbody2D>();
        private void Start() => InteractionSystem.Instance?.SetPlayer(transform);
        private void Update()
        {
            input = new Vector2(Input.GetAxisRaw("Horizontal"), Input.GetAxisRaw("Vertical")).normalized;
            if (Input.GetKeyDown(KeyCode.E)) InteractionSystem.TryInteract();
        }
        private void FixedUpdate() => body.MovePosition(body.position + input * speed * Time.fixedDeltaTime);
    }
}
