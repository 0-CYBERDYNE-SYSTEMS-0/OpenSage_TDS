import os

from google.adk.models.lite_llm import LiteLlm
from opensage.agents.opensage_agent import OpenSageAgent
from opensage.toolbox.general.bash_tool import bash_tool_main


def mk_agent(opensage_session_id: str):
    return OpenSageAgent(
        name="gemini_assistant",
        model=LiteLlm(
            model="gemini/gemini-2.0-flash",
            api_key=os.environ.get("GEMINI_API_KEY"),
        ),
        description="A helpful coding assistant using Gemini free tier.",
        instruction="You are a helpful coding assistant. Use bash_tool_main to run commands when needed.",
        tools=[bash_tool_main],
    )
