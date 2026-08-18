extends CharacterBody2D
class_name PrototypePlayer

@export var speed := 120.0
var facing := Vector2.DOWN

func _physics_process(_delta):
    var input := Input.get_vector("move_left", "move_right", "move_up", "move_down")
    velocity = input * speed
    if input.length() > 0.0:
        facing = input
    move_and_slide()
    queue_redraw()

func _draw():
    # Pixel-art character drawn procedurally so the prototype has zero external asset dependencies.
    draw_rect(Rect2(-7,-12,14,12), Color("#925f43"))
    draw_rect(Rect2(-10,-15,20,6), Color("#2a1b22"))
    draw_rect(Rect2(-9,0,18,20), Color("#563078"))
    draw_rect(Rect2(-11,4,3,12), Color("#563078"))
    draw_rect(Rect2(8,4,3,12), Color("#563078"))
    draw_rect(Rect2(-9,20,7,5), Color("#9b2635"))
    draw_rect(Rect2(2,20,7,5), Color("#9b2635"))
    draw_rect(Rect2(-5,-7,2,2), Color("#15131a"))
    draw_rect(Rect2(3,-7,2,2), Color("#15131a"))
