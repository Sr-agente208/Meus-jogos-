extends Area2D

@export var prompt := "[E] Examinar terminal"
@export var result := "O terminal está ligado. Há um arquivo que você não se lembra de ter criado."
var player_near := false
var used := false

func _ready():
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)
    queue_redraw()

func _process(_delta):
    if player_near and Input.is_action_just_pressed("interact"):
        used = true
        var main := get_tree().current_scene
        if main.has_method("show_message"):
            main.show_message(result)
        queue_redraw()

func _on_body_entered(body):
    if body is CharacterBody2D:
        player_near = true
        queue_redraw()

func _on_body_exited(body):
    if body is CharacterBody2D:
        player_near = false
        queue_redraw()

func _draw():
    draw_rect(Rect2(-20,-15,40,30), Color("#26343b"))
    draw_rect(Rect2(-16,-11,32,18), Color("#101820"))
    draw_rect(Rect2(-10,-6,8,4), Color("#6d36a8"))
    draw_rect(Rect2(2,-6,8,4), Color("#3d8c69"))
    draw_rect(Rect2(-5,12,10,3), Color("#73553b"))
    if player_near:
        draw_rect(Rect2(-72,-36,144,16), Color("#08080d"))
        draw_string(ThemeDB.fallback_font, Vector2(-64,-24), prompt, HORIZONTAL_ALIGNMENT_LEFT, -1, 10, Color("#eeeeee"))
