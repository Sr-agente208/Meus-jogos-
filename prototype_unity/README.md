# Mundo Torajo — Protótipo Unity

Base Unity 2D para a primeira cena jogável de **Mundo Torajo: Sinal Azul**. Ela replica o fluxo do protótipo web e deixa a estrutura pronta para crescer em cenas, entidades e capítulos.

## Requisitos

- Unity Hub
- **Unity 2022.3 LTS** ou versão mais recente compatível
- Template **2D Core**

## Abrir

1. No Unity Hub, clique em **Add / Open**.
2. Selecione a pasta `prototype_unity`.
3. Caso o Hub peça, escolha Unity 2022.3 LTS.
4. Crie uma cena `Assets/Scenes/Chapter01.unity`.

## Montagem da primeira cena

1. Crie um objeto `GameState` e adicione `GameState.cs`.
2. Crie um objeto `InteractionSystem` e adicione `InteractionSystem.cs`.
3. Crie `Player` com `SpriteRenderer`, `Rigidbody2D` (Gravity Scale 0) e `CircleCollider2D`; adicione `PlayerController.cs`.
4. No `InteractionSystem`, use `SetPlayer` por um script de bootstrap ou atribua o Player na inicialização.
5. Crie objetos com `BoxCollider2D` (marque a layer **Interactable**) e `WorldInteractable.cs`:
   - Mirror
   - Record
   - Terminal
   - Core (inativo no início)
   - Door (inativa no início)
6. Ligue `anomaly`, `core` e `sectorDoor` nos campos de `GameState`.

## Progressão implementada

`Espelho → Registro SJM-07 → Terminal (chave 0x7) → Núcleo Azul → Porta do Setor 02`.

- **WASD / setas**: movimento.
- **E**: interação próxima.
- Estado de checkpoint do Núcleo é salvo em `PlayerPrefs`.

## Próximos passos

- UI de diálogo e inventário em Canvas;
- arte pixelada e Tilemap;
- áudio e primeira entidade com máquina de estados;
- build WebGL para GitHub Pages e Android para APK.
