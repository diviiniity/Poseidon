#include "pspch.h"
#include "Application.h"

#include "Events/KeyEvent.h"
#include "Log.h"



namespace Poseidon {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		KeyPressedEvent e(70, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			PS_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			PS_TRACE(e);
			PS_WARN(e.GetName());
		}

		while (true);

	}
}