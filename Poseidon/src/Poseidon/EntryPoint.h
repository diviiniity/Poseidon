#pragma once

#ifdef PS_PLATFORM_WINDOWS

extern Poseidon::Application* Poseidon::CreateApplication();

int main(int argc, char** argv) {

	Poseidon::Log::Init();
	PS_CORE_CRITICAL("Initialized Log");
	PS_CORE_TRACE("Run");
	std::string a = "diviiniity";
	PS_WARN("{0} is fucking hot", a);

	auto app = Poseidon::CreateApplication();
	app->Run();
	delete app;

}

#endif