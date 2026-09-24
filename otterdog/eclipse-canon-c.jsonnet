local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.threadx.canon-c', 'eclipse-canon-c') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Canon-C project",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('Canon-C') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "A semantic standard library for verified C — with explicit, composable verified primitives that can scale.",
      has_discussions: true,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "c",
        "c-library",
        "c99",
        "cross-platform",
        "defer-pattern",
        "embedded",
        "error-handling",
        "explicit",
        "header-only",
        "high-performance",
        "lifetime",
        "memory-management",
        "memory-safety",
        "optional-type",
        "ownership",
        "result-type",
        "safety-critical",
        "systems-programming",
        "type-safety",
        "verification"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        orgs.newRepoRuleset('DO') {
          allows_updates: false,
          required_status_checks: null,
          requires_commit_signatures: true,
          requires_deployments: true,
          requires_linear_history: true,
          required_pull_request+: {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            requires_code_owner_review: true,
            requires_last_push_approval: true,
            requires_review_thread_resolution: true,
          },
        },
      ],
      environments: [
        orgs.newEnvironment('copilot'),
      ],
    },
    orgs.newRepo('project-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Canon-C project website",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('external-classifications') {
      allow_merge_commit: true,
      allow_update_branch: false,
      custom_properties: {
        eclipse_project: "iot.threadx.canon-c"
      },
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('academic-related') {
      allow_auto_merge: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
