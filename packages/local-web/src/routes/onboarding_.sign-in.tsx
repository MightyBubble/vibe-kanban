import { createFileRoute } from '@tanstack/react-router';
import { OnboardingSignInPage } from '@/features/onboarding/ui/OnboardingSignInPage';
import { RootRedirectPage } from '@/pages/root/RootRedirectPage';
import { hasRemoteApi } from '@/shared/lib/remoteApi';

function OnboardingSignInRouteComponent() {
  return hasRemoteApi() ? <OnboardingSignInPage /> : <RootRedirectPage />;
}

export const Route = createFileRoute('/onboarding_/sign-in')({
  component: OnboardingSignInRouteComponent,
});
