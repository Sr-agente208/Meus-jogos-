using UnityEngine;

namespace MundoTorajo
{
    public interface IInteractable { string Prompt { get; } void Interact(); }

    public class InteractionSystem : MonoBehaviour
    {
        public static InteractionSystem Instance { get; private set; }
        [SerializeField] private float radius = 1.2f;
        [SerializeField] private LayerMask interactableLayer;
        private Transform player;

        private void Awake() => Instance = this;
        public void SetPlayer(Transform target) => player = target;
        public static void TryInteract() => Instance?.FindClosest();
        private void FindClosest()
        {
            if (player == null) return;
            var hits = Physics2D.OverlapCircleAll(player.position, radius, interactableLayer);
            IInteractable closest = null; float distance = float.MaxValue;
            foreach (var hit in hits)
            {
                IInteractable candidate = null;
                foreach (var behaviour in hit.GetComponents<MonoBehaviour>())
                {
                    candidate = behaviour as IInteractable;
                    if (candidate != null) break;
                }
                if (candidate == null) continue;
                float current = Vector2.Distance(player.position, hit.transform.position);
                if (current < distance) { distance = current; closest = candidate; }
            }
            closest?.Interact();
        }
    }
}
