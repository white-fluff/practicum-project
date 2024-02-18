import os, argparse, requests
from requests import RequestException

# About: Script for release notification 
# Author: Konstantin Belopukhov


def notify(service: str,
           artifact: str,
           version: str,
           token: str,
           chat_id: str):

    url = f"https://api.telegram.org/bot{token}/sendMessage"
    headers = {"Content-type": "application/json"}
    body = {"chat_id": f"-{chat_id}",
            "parse_mode": 'html',
            "text": f"<b>Momo-Store: {service}</b>" + "\n" +
            f"A new version has been released: {version}" + "\n" +
            f'You can download the artifact from the <b><a href="{artifact}">link</a></b>' + "\n" +
            "The latest image has been updated in the repository."
            }
    try:
        response = requests.post(url=url, headers=headers, json=body)
    except RequestException as ex:
        print(f"Something went wrong:\n{ex}")

    print(f"HookStatus: {response.status_code}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Release notification script")

    token = os.getenv("TG_BOT_TOKEN")
    chat_id = os.getenv("CHAT_ID")
    
    parser.add_argument("--service", type=str, required=True,
                        help='Required argument. Expects either "BACKEND" or "FRONTEND".')
    parser.add_argument("--artifact", type=str, required=True,
                        help='Required argument. Link to artifact in repository.')
    parser.add_argument("--version", type=str, required=True,
                        help='Required argument. Service version.')
    
    args = parser.parse_args()
    
    service = args.service
    artifact = args.artifact
    version = args.version

    print(f"Service: {service}\nArtifact: {artifact}\nVersion: {version}")
    notify(service, artifact, version, token, chat_id)
