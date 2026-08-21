using UnityEngine;

namespace MundoTorajo
{
    public class GameState : MonoBehaviour
    {
        public static GameState Instance { get; private set; }
        public bool MirrorSeen { get; private set; }
        public bool RecordFound { get; private set; }
        public bool TerminalSolved { get; private set; }
        public bool CoreAwake { get; private set; }
        [SerializeField] private GameObject anomaly;
        [SerializeField] private GameObject core;
        [SerializeField] private GameObject sectorDoor;

        private void Awake() { Instance = this; Load(); }
        public void Interact(StoryObject target, GameObject source)
        {
            switch (target)
            {
                case StoryObject.Mirror: MirrorSeen = true; if (anomaly) anomaly.SetActive(true); Notice("O reflexo olhou primeiro."); break;
                case StoryObject.Record: RecordFound = true; source.SetActive(false); Notice("DOC_001 coletado: Protocolo Espelho = 0x7."); break;
                case StoryObject.Terminal: if (RecordFound) { TerminalSolved = true; if (core) core.SetActive(true); Notice("Terminal sincronizado. O Núcleo respondeu."); } else Notice("O terminal exige uma chave narrativa."); break;
                case StoryObject.Core: if (TerminalSolved) { CoreAwake = true; if (sectorDoor) sectorDoor.SetActive(true); Notice("Núcleo Azul desperto. Setor 02 liberado."); } else Notice("O Núcleo está inativo."); break;
                case StoryObject.Door: if (CoreAwake) { Notice("CHECKPOINT_01 — Capítulo 2: Laboratório."); Save(); } else Notice("A porta está selada."); break;
            }
            Save();
        }
        private void Notice(string text) { Debug.Log("[Mundo Torajo] " + text); }
        private void Save() => PlayerPrefs.SetInt("torajo_core", CoreAwake ? 1 : 0);
        private void Load() { CoreAwake = PlayerPrefs.GetInt("torajo_core", 0) == 1; if (sectorDoor) sectorDoor.SetActive(CoreAwake); }
    }
}
