#pragma once

#include "Core.h"

#include "Window.h"
#include "Poseidon/LayerStack.h"
#include "Poseidon/Events/Event.h"
#include "Poseidon/Events/ApplicationEvent.h"

#include "Poseidon/ImGui/ImGuiLayer.h"

namespace Poseidon {

	class POSEIDON_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushOverlay(Layer* layer);
		void PushLayer(Layer* layer);

		inline Window& GetWindow() { return *m_Window; }

		inline static Application& Get() { return *s_Instance; }
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		ImGuiLayer* m_ImGuiLayer;
		bool m_Running = true;
		LayerStack m_LayerStack;
	private:
		static Application* s_Instance;
	};

	// To be defined in client
	Application* CreateApplication();

}

