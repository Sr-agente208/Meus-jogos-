using UnityEngine;

namespace MundoTorajo
{
    public enum StoryObject { Mirror, Record, Terminal, Core, Door }
    public class WorldInteractable : MonoBehaviour, IInteractable
    {
        [SerializeField] private StoryObject objectType;
        public string Prompt => "[E] " + objectType;
        public void Interact() => GameState.Instance?.Interact(objectType, gameObject);
    }
}
