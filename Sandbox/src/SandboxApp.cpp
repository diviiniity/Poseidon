#include <Poseidon.h>

#include "imgui/imgui.h"

class ExampleLayer : public Poseidon::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
	}

	virtual void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello world!");
		ImGui::End();
	}

	void OnEvent(Poseidon::Event& event) override
	{
		if (event.GetEventType() == Poseidon::EventType::KeyPressed)
		{
		}
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