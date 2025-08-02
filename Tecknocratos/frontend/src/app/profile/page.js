'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';

export default function ProfilePage() {
  const router = useRouter();

  useEffect(() => {
    const isAuthenticated = localStorage.getItem('token'); // Or your auth check logic

    if (!isAuthenticated) {
      router.push('/login'); // Redirect to login if not authenticated
    }
  }, []);

  return (
    <div>
      <h1>Welcome to your Profile</h1>
      {/* Add your profile content here */}
    </div>
  );
}
