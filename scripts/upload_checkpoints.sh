python3 -c "
from huggingface_hub import HfApi
api = HfApi()
api.upload_folder(
   folder_path='checkpoints/TinyZero/countdown-qwen2.5-0.5b/actor/global_step_900',
   repo_id='svilupp/tinyzero-countdown-qwen2.5-0.5b',
   repo_type='model',
   path_in_repo='actor'
)
api.upload_folder(
   folder_path='checkpoints/TinyZero/countdown-qwen2.5-0.5b/critic/global_step_900',
   repo_id='svilupp/tinyzero-countdown-qwen2.5-0.5b',
   repo_type='model', 
   path_in_repo='critic'
)"