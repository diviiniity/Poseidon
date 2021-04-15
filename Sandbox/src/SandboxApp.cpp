#include <Poseidon.h>

class Sandbox : public Poseidon::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

Poseidon::Application* Poseidon::CreateApplication()
{
	return new Sandbox();
}