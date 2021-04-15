#pragma once

#include "Core.h"

namespace Poseidon {

	class POSEIDON_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in client
	Application* CreateApplication();

}

