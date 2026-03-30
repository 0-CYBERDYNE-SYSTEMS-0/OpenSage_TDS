import os

from google.adk.models.lite_llm import LiteLlm
from opensage.agents.opensage_agent import OpenSageAgent
from opensage.toolbox.general.bash_tool import bash_tool_main


def mk_agent(opensage_session_id: str):
    return OpenSageAgent(
        name="minimax_m27",
        model=LiteLlm(
            model="openai/MiniMax-M2.7",
            api_key=os.environ.get("MINIMAX_API_KEY"),
            base_url="https://api.minimax.io/v1",
        ),
        description="Coding assistant powered by MiniMax-M2.7",
        instruction="You are a helpful coding assistant. Use bash_tool_main to run commands when needed.",
        tools=[bash_tool_main],
    )
