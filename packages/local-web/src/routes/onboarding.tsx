import { createFileRoute } from '@tanstack/react-router';
import { LandingPage } from '@/features/onboarding/ui/LandingPage';
import { RootRedirectPage } from '@/pages/root/RootRedirectPage';
import { hasRemoteApi } from '@/shared/lib/remoteApi';

function OnboardingLandingRouteComponent() {
  return hasRemoteApi() ? <LandingPage /> : <RootRedirectPage />;
}

export const Route = createFileRoute('/onboarding')({
  component: OnboardingLandingRouteComponent,
});
