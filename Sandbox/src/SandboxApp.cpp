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
		if (Poseidon::Input::IsKeyPressed(PS_KEY_TAB))
			PS_TRACE("Tab key is pressed (poll)");
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
			Poseidon::KeyPressedEvent& e = (Poseidon::KeyPressedEvent&)event;
			if (e.GetKeyCode() == PS_KEY_TAB)
				PS_TRACE("Tab key is pressed (event)");
			PS_TRACE("{0}", (char)e.GetKeyCode());
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