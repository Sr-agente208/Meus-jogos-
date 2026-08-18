# Protótipo jogável — primeira cena

## Engine
Godot 4.x.

## Objetivo
Esta é a primeira cena jogável real do projeto. Ela parte do estado atual confirmado: **uma única tela**, sem fases ou bosses implementados.

## O que já funciona
- personagem controlável
- movimentação WASD/setas
- câmera seguindo o jogador
- colisões básicas da sala
- cenário em pixel-art procedural
- terminal interativo
- tecla `E` para interação
- mensagem narrativa após interação
- filtro visual de baixa resolução/nearest para preservar aparência pixelada

## Controles
- `WASD` ou setas: mover
- `E`: interagir com o terminal

## Estrutura

```text
prototype_godot/
├── Main.tscn
├── main.gd
├── player.gd
├── interactable.gd
└── README.md
```

O `project.godot` fica na raiz do repositório para permitir abrir esta pasta como parte do projeto.

## Direção visual
Pixel horror de baixa resolução, com paleta escura, roxo como cor de anomalia e vermelho como sinal de perigo. A referência é a atmosfera de jogos de terror em pixel art, sem copiar personagens ou assets de terceiros.

## Próximo passo
Adicionar um segundo objeto interativo e o primeiro evento de suspense **sem criar fases novas ainda**. Depois disso, implementar um sistema simples de estado/eventos e somente então expandir a cena.
