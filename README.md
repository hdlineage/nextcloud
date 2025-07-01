This Nextcloud apache docker comes with ffmpeg pre-installed for video thumbnail generation.
<?php
namespace IframeFix\AppInfo;

use OCP\AppFramework\App;
use OCP\Security\CSP\ContentSecurityPolicy;
use OCP\AppFramework\Bootstrap\IBootstrap;
use OCP\AppFramework\Bootstrap\IRegistrationContext;

class Application extends App implements IBootstrap {

    public function __construct(array $urlParams = []) {
        parent::__construct('iframefix', $urlParams);
    }

    public function register(IRegistrationContext $context): void {
        $context->registerEventListener(
            \OCP\AppFramework\Http\Events\BeforeTemplateRenderedEvent::class,
            function($event) {
                $policy = new ContentSecurityPolicy();
                $policy->addAllowedFrameDomain('https://portal.mapleduck.com');
                $event->getResponse()->getContentSecurityPolicy()->addPolicy($policy);
            }
        );
    }

    public function boot(\OCP\AppFramework\Bootstrap\IBootContext $context): void {
        // no-op
    }
}
