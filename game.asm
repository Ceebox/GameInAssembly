.include "tools.asm"

START
	mov FPSx, par1.32
	mov FPSy, par2.32
	lea WindowTitle(rip), par3
	call InitWindow

	MainLoop:
		call BeginDrawing
		mov $0xffffffff, par1.32
		call ClearBackground

		mov $256-64, r15d
		CircleLoop:
			mov r15d, par1.32
			mov $1080/2, par2.32

			/*Get radius, set colour, draw circle*/
			mov $256-64, par1.32
			mov $512-64, par2.32
			movss CircleRadius(rip), xmm2
			mov $0xff3535ff, par4.32
			call DrawCircle

			/*Reduce counter and loop*/
			sub $64, r15d
			jnz CircleLoop

		/*Draw FPS*/
		mov FPSy, par1.32
		mov FPSx, par2.32
		call DrawFPS
		call EndDrawing

		/*Check if window should close*/
		call WindowShouldClose
		test eax, eax

		/*Infinite Loop*/
		jz MainLoop

	call CloseWindow
EXIT

/* Window Data */
WindowTitle: .string "This is a test"
/* Draw FPS Data */
FPSx: .int 0
FPSy: .int 0
/*Game Data*/
CircleRadius: .single 25
CirclePosition: .single 0