import { render, screen } from '@testing-library/react';
import App from './App';

test('renders password', () => {
  render(<App />);
  const password_label = screen.getByText(/Password/i);
  expect(password_label).toBeInTheDocument();
});
