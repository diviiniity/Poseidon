#include <Poseidon.h>

class ExampleLayer : public Poseidon::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		PS_INFO("ExampleLayer::Update");
	}

	void OnEvent(Poseidon::Event& event) override
	{
		PS_TRACE("{0}", event);
	}
};

class Sandbox : public Poseidon::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}

};

Poseidon::Application* Poseidon::CreateApplication()
{
	return new Sandbox();
}