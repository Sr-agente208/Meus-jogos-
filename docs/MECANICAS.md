# Algorthomus.EXE — Mecânicas do protótipo

## Loop de exploração

1. O jogador explora a cidade de Verade usando teclado ou controles de toque.
2. O espelho `0x7` introduz a anomalia e revela três ecos azuis.
3. Cada eco absorvido aumenta a corrupção (C.O.R.) e altera a leitura do HUD.
4. Depois de reunir os três ecos, o Núcleo Azul se materializa.
5. A interação com o Núcleo conclui o prólogo e exibe o gancho para `ZERAL_//`.

## Controles

| Plataforma | Movimento | Interação / diálogo |
| --- | --- | --- |
| Computador | `WASD` ou setas | `E`; `Enter` ou clique para continuar texto |
| Dispositivo de toque | botões na tela | botão `E` e botões de diálogo |

## Sistemas implementados

- **C.O.R.**: indicador de corrupção atualizado por eventos da narrativa.
- **BPM**: representação visual de tensão vinculada à corrupção.
- **Ecos**: colecionáveis necessários para liberar o Núcleo Azul.
- **Eventos de interface**: mensagens aleatórias do sistema e efeitos glitch.
- **Final ramificado**: aceitar ou recusar o Protocolo Espelho altera a mensagem final.

O protótipo não grava informações do usuário, não usa microfone e não manipula arquivos ou configurações do dispositivo.
