# TinyZero
![image](cover.png)

TinyZero is a reproduction of [DeepSeek R1 Zero](https://github.com/deepseek-ai/DeepSeek-R1) in countdown and multiplication tasks. We built upon [veRL](https://github.com/volcengine/verl).

Through RL, the 3B base LM develops self-verification and search abilities all on its own 

You can experience the Ahah moment yourself for < $30 

Twitter thread: https://x.com/jiayi_pirate/status/1882839370505621655

Full experiment log: https://wandb.ai/jiayipan/TinyZero

Paper's on it's way!

## Installation

Install uv
```
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
```
Then run the following
```
uv venv
source .venv/bin/activate
uv pip install torch==2.4.0 --index-url https://download.pytorch.org/whl/cu121
uv pip install vllm==0.6.3 ray
uv pip install -e .
uv pip install flash-attn --no-build-isolation
uv pip install wandb IPython matplotlib
```

From now on, we assume you have your **virtual environment activated** (`source .venv/bin/activate`).

## Countdown task

**Data Preparation**
```
python ./examples/data_preprocess/countdown.py --template_type=qwen-instruct
```

### Model Download

Download the Qwen 2.5 0.5bn model into folder `models/`
```
python model_download.py
```

### Run Training

I needed 2xA100 to run the below and avoid OoM.

```
export N_GPUS=2
export BASE_MODEL=models/Qwen2.5-0.5B-Instruct
export DATA_DIR=~/data/countdown
export ROLLOUT_TP_SIZE=1
export EXPERIMENT_NAME=countdown-qwen2.5-0.5b
export VLLM_ATTENTION_BACKEND=XFORMERS

bash ./scripts/train_tiny_zero-0.5b.sh
```

Note: I had to enable checkpointing to avoid OoM, the model kept loading in F32 increasing the VRAM required.

## Acknowledge
* This script is forked from [TinyZero](https://github.com/Jiayi-Pan/TinyZero).
* We run our experiments based on [veRL](https://github.com/volcengine/verl).
* We use Qwen2.5 series base model [Qwen2.5](https://github.com/QwenLM/Qwen2.5).
