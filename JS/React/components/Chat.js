import React, { useState, useRef, useEffect } from 'react';

function Chat() {
  const [messages, setMessages] = useState([]);
  const [newMessage, setNewMessage] = useState('');
  const chatContainerRef = useRef(null);

  const sendMessage = () => {
    if (newMessage.trim()) {
      setMessages([...messages, newMessage]);
      setNewMessage('');
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      sendMessage();
    }
  };

  useEffect(() => {
    const chatContainer = chatContainerRef.current;
    chatContainer.scrollTop = chatContainer.scrollHeight;
  }, [messages]);

  useEffect(() => {
    const chatContainer = chatContainerRef.current;
    chatContainer.scrollTop = chatContainer.scrollHeight;
  }, [messages]);

  return (
    <div className='grid grid-cols-12 gap-4'>
      {/* Sidebar */}
      <div className='col-span-1 flex flex-col items-center rounded-md bg-gray-100 p-4'>
        <ul>
          <li className='mb-4 rounded-md bg-gray-300 p-2'>
            <svg className="h-6 w-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
              <path fillRule="evenodd" d="M3 6a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-6.616l-2.88 2.592C8.537 20.461 7 19.776 7 18.477V17H5a2 2 0 0 1-2-2V6Zm4 2a1 1 0 0 0 0 2h5a1 1 0 1 0 0-2H7Zm8 0a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2h-2Zm-8 3a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2H7Zm5 0a1 1 0 1 0 0 2h5a1 1 0 1 0 0-2h-5Z" clipRule="evenodd" />
            </svg>
          </li>

          <li className='p-2'>
            <svg className="h-6 w-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
              <path fillRule="evenodd" d="M8 4a4 4 0 1 0 0 8 4 4 0 0 0 0-8Zm-2 9a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2v-1a4 4 0 0 0-4-4H6Zm7.25-2.095c.478-.86.75-1.85.75-2.905a5.973 5.973 0 0 0-.75-2.906 4 4 0 1 1 0 5.811ZM15.466 20c.34-.588.535-1.271.535-2v-1a5.978 5.978 0 0 0-1.528-4H18a4 4 0 0 1 4 4v1a2 2 0 0 1-2 2h-4.535Z" clipRule="evenodd" />
            </svg>
          </li>
        </ul>
      </div>

      {/* Chat list */}
      <div className='col-span-3 m-2 rounded-md bg-gray-100 p-4'>
        <h1 className='text-xl font-bold'>Chats</h1>
        <div className='my-4 rounded-lg bg-gray-200'>
          <p className='pl-4 font-semibold'>Alexander Acojido</p>
          <p className='pl-4 text-gray-500'>You: a 2h</p>
        </div>
        <div className='my-4 rounded-lg bg-gray-200'>
          <p className='pl-4 font-semibold'>Person 2</p>
          <p className='pl-4 text-gray-500'>You: a 2h</p>
        </div>
      </div>

      {/* Chat window */}
      <div className='col-span-8 col-start-5'>
        <div ref={chatContainerRef} className="max-h-96 overflow-y-auto rounded-lg border-gray-200 bg-gray-100 pb-4">
          <div className="sticky top-0 bg-gray-100 p-4">
            <span className="ml-4 font-semibold text-gray-900">Alexander Acojido</span>
          </div>

          <div className="flex flex-col items-end">
            {messages.map((msg, index) => (
              <div key={index} className="msg">
                {msg}
              </div>
            ))}
          </div>

          <div className="sticky bottom-0 flex bg-gray-100 p-4">
            <input
              type="text"
              value={newMessage}
              onChange={(e) => setNewMessage(e.target.value)}
              onKeyPress={handleKeyPress}
              className="flex-grow rounded-full p-2"
              placeholder="Aa"
            />
            <button onClick={sendMessage} className="ml-2">
              <svg className="h-6 w-6 text-gray-800" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="m12 18-7 3 7-18 7 18-7-3Zm0 0v-5" />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Chat;
