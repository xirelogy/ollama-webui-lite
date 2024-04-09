import Config from "../config.json"

export function getEnvConstOllamaApiBaseUrl(): string {
  return Config.OLLAMA_API_BASE_URL;
}