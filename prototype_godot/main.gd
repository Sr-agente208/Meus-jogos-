extends Node2D

var message := "Explore o ambiente. Pressione E perto do terminal."
var message_time := 0.0

func _ready():
    queue_redraw()

func show_message(text: String):
    message = text
    message_time = 3.5
    queue_redraw()

func _process(delta):
    if message_time > 0.0:
        message_time -= delta
        queue_redraw()

func _draw():
    # 640x360 prototype room: deliberately low-detail pixel horror palette.
    draw_rect(Rect2(0,0,640,360), Color("#08080d"))
    draw_rect(Rect2(24,24,592,312), Color("#171821"))
    draw_rect(Rect2(24,24,592,16), Color("#29232f"))
    draw_rect(Rect2(24,320,592,16), Color("#29232f"))
    draw_rect(Rect2(24,24,16,312), Color("#29232f"))
    draw_rect(Rect2(600,24,16,312), Color("#29232f"))

    # floor tiles
    for y in range(56,320,32):
        for x in range(56,600,32):
            draw_rect(Rect2(x,y,31,31), Color("#20212a"), false, 1.0)

    # desk + terminal
    draw_rect(Rect2(88,118,132,54), Color("#4b382b"))
    draw_rect(Rect2(98,104,112,16), Color("#72543a"))
    draw_rect(Rect2(126,78,64,40), Color("#2b3943"))
    draw_rect(Rect2(132,84,52,28), Color("#101820"))
    draw_rect(Rect2(143,94,8,6), Color("#6d36a8"))
    draw_rect(Rect2(158,90,18,4), Color("#3d8c69"))

    # shelves
    draw_rect(Rect2(420,86,100,130), Color("#3c2d27"))
    for y in [108,140,172,204]:
        draw_rect(Rect2(426,y,88,5), Color("#73553b"))
    draw_rect(Rect2(438,114,12,20), Color("#8b3d3d"))
    draw_rect(Rect2(463,114,18,20), Color("#5b3c70"))
    draw_rect(Rect2(488,146,16,22), Color("#80683b"))

    # locked door
    draw_rect(Rect2(530,116,50,96), Color("#3b252d"))
    draw_rect(Rect2(538,124,34,80), Color("#4a2d30"))
    draw_rect(Rect2(560,160,6,6), Color("#9b2635"))

    # table with mysterious object
    draw_rect(Rect2(254,210,122,46), Color("#4b392c"))
    draw_rect(Rect2(270,194,90,16), Color("#73553b"))
    draw_rect(Rect2(300,174,30,22), Color("#101820"))
    draw_rect(Rect2(306,180,18,8), Color("#6d36a8"))

    # subtle light pool
    draw_circle(Vector2(320,145), 120.0, Color(0.25,0.18,0.35,0.055))
    draw_circle(Vector2(320,145), 72.0, Color(0.35,0.28,0.45,0.035))

    # HUD
    draw_rect(Rect2(18,8,180,12), Color("#101018"))
    draw_rect(Rect2(22,11,126,6), Color("#9b2635"))
    draw_rect(Rect2(22,22,180,2), Color("#6d36a8"))
    draw_string(ThemeDB.fallback_font, Vector2(22,48), "WASD / SETAS  •  E INTERAGIR", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color("#c9c5d2"))

    if message_time > 0.0:
        draw_rect(Rect2(90,286,460,38), Color(0.03,0.03,0.05,0.92))
        draw_rect(Rect2(90,286,4,38), Color("#6d36a8"))
        draw_string(ThemeDB.fallback_font, Vector2(106,310), message, HORIZONTAL_ALIGNMENT_LEFT, 430, 14, Color("#eeeeee"))
