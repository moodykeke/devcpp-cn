// Example of Windows program

#include <windows.h>

#define ID_HELLOBUTTON	1005

/* This is where all the input to the window goes to */
LRESULT CALLBACK WndProc(HWND hwnd, UINT Message, WPARAM wParam,LPARAM lParam) {
	switch(Message) {
		case WM_DESTROY: {
			PostQuitMessage(0);
			break;
		}

		case WM_COMMAND: {
			switch(LOWORD(wParam)) {
				case ID_HELLOBUTTON: {
					MessageBox(NULL,"Hello, Windows!", "Hello", MB_ICONINFORMATION + MB_OK);
					break;
				}
			}
			break;
		}

		case WM_CREATE: {
			// Create fancy fonts
			HDC hdc = GetDC(hwnd);
			HFONT font1 = CreateFont(-MulDiv(12,GetDeviceCaps(hdc, LOGPIXELSY),72),0,0,0,0,0,
			                         0,0,0,0,0,0,0,"Segoe UI");

			// Create compare button
			HWND CompareButton = CreateWindow("BUTTON", "Hello, Windows",
			                                  WS_CHILD|WS_VISIBLE,50,130,200,30,hwnd,(HMENU)ID_HELLOBUTTON,
			                                  GetModuleHandle(NULL),NULL);
			SendMessage(CompareButton,WM_SETFONT,(WPARAM)font1,0);

			// Release handles
			ReleaseDC(hwnd,hdc);
			break;
		}

		/* All other messages (a lot of them) are processed using default procedures */
		default:
			return DefWindowProc(hwnd, Message, wParam, lParam);
	}
	return 0;
}

/* The 'main' function of Win32 GUI programs: this is where execution starts */
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,LPSTR lpCmdLine, int nCmdShow) {
	WNDCLASSEX wc; /* A properties struct of our window */
	HWND hwnd; /* A 'HANDLE', hence the H, or a pointer to our window */
	MSG msg; /* A temporary location for all messages */

	/* zero out the struct and set the stuff we want to modify */
	memset(&wc,0,sizeof(wc));
	wc.cbSize		 = sizeof(WNDCLASSEX);
	wc.lpfnWndProc	 = WndProc; /* This is where we will send messages to */
	wc.hInstance	 = hInstance;
	wc.hCursor		 = LoadCursor(NULL, IDC_ARROW);

	/* White, COLOR_WINDOW is just a #define for a system color, try Ctrl+Clicking it */
	wc.hbrBackground = (HBRUSH)(COLOR_WINDOW);
	wc.lpszClassName = "WindowClass";
	wc.hIcon		 = LoadIcon(NULL, IDI_APPLICATION); /* Load a standard icon */
	wc.hIconSm		 = LoadIcon(NULL,
	                            IDI_APPLICATION); /* use the name "A" to use the project icon */

	if(!RegisterClassEx(&wc)) {
		MessageBox(NULL, "Window Registration Failed!","Error!",
		           MB_ICONEXCLAMATION|MB_OK);
		return 0;
	}

	hwnd = CreateWindowEx(WS_EX_CLIENTEDGE, "WindowClass", "Hello",
	                      WS_VISIBLE|(WS_OVERLAPPEDWINDOW^WS_THICKFRAME),
	                      CW_USEDEFAULT, /* x */
	                      CW_USEDEFAULT, /* y */
	                      640, /* width */
	                      480, /* height */
	                      NULL,NULL,hInstance,NULL);

	if(hwnd == NULL) {
		MessageBox(NULL, "Window Creation Failed!","Error!",MB_ICONEXCLAMATION|MB_OK);
		return 0;
	}

	/*
		This is the heart of our program where all input is processed and
		sent to WndProc. Note that GetMessage blocks code flow until it receives something,
		so this loop will not produce unreasonably high CPU usage
	*/
	while(GetMessage(&msg, NULL, 0, 0) > 0) { /* If no error is received... */
		TranslateMessage(&msg); /* Translate key codes to chars if present */
		DispatchMessage(&msg); /* Send it to WndProc */
	}
	return msg.wParam;
}
