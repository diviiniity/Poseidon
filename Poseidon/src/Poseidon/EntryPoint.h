#pragma once

#ifdef PS_PLATFORM_WINDOWS

extern Poseidon::Application* Poseidon::CreateApplication();

int main(int argc, char** argv) {

	auto app = Poseidon::CreateApplication();
	app->Run();
	delete app;

}

#endif