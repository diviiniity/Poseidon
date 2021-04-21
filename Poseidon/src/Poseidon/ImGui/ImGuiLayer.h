#pragma once

#include "Poseidon/Layer.h"

#include <Poseidon/Events/ApplicationEvent.h>
#include <Poseidon/Events/MouseEvent.h>
#include <Poseidon/Events/KeyEvent.h>

namespace Poseidon {

	class POSEIDON_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};

}
