#pragma once

#include "Core.h"

#include "Window.h"
#include "Poseidon/LayerStack.h"
#include "Poseidon/Events/Event.h"
#include "Poseidon/Events/ApplicationEvent.h"

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
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be defined in client
	Application* CreateApplication();

}

