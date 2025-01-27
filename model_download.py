from transformers import AutoTokenizer, AutoModelForCausalLM

model_name = "Qwen/Qwen2.5-0.5B-Instruct"
save_path = "models/Qwen2.5-0.5B-Instruct"

# Download model and tokenizer
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)

# Save locally
model.save_pretrained(save_path)
tokenizer.save_pretrained(save_path)