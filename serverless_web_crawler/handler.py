import json
from typing import Any, Dict

from sqs import sqs_client

SQS_NAME = "serverless-web-crawler-sqs"

def enqueuer(event: Dict[str, Any], _: Any) -> None:
    """
    """
    queue_url = get_queue_url()
    sqs_client.send_message(QueueUrl=queue_url, MessageBody="string")
    print('sent message')

def scanner(event: Dict[str, Any], _: Any) -> None:
    """
    """
    print('event', event)
    queue_url = get_queue_url()
    response = sqs_client.receive_message(QueueUrl=queue_url)
    print('response', response)

def get_queue_url() -> str:
    return sqs_client.get_queue_url(
    QueueName=SQS_NAME,
)['QueueUrl']