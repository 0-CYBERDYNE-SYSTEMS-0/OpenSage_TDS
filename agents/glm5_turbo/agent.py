import os

from google.adk.models.lite_llm import LiteLlm
from opensage.agents.opensage_agent import OpenSageAgent
from opensage.toolbox.general.bash_tool import bash_tool_main


def mk_agent(opensage_session_id: str):
    return OpenSageAgent(
        name="glm5_turbo",
        model=LiteLlm(
            model="openai/glm-5-turbo",
            api_key=os.environ.get("ZAI_CODING_API_KEY"),
            base_url="https://api.z.ai/api/coding/paas/v4",
        ),
        description="Coding assistant powered by ZAI GLM-5-Turbo (faster)",
        instruction="You are a helpful coding assistant. Use bash_tool_main to run commands when needed.",
        tools=[bash_tool_main],
    )
