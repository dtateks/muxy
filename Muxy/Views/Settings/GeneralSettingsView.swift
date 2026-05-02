import SwiftUI

enum GeneralSettingsKeys {
    static let autoExpandWorktreesOnProjectSwitch = "muxy.general.autoExpandWorktreesOnProjectSwitch"
    static let showNavigationArrows = "muxy.general.showNavigationArrows"
}

struct GeneralSettingsView: View {
    @AppStorage(GeneralSettingsKeys.autoExpandWorktreesOnProjectSwitch)
    private var autoExpandWorktrees = false
    @AppStorage(TabCloseConfirmationPreferences.confirmRunningProcessKey)
    private var confirmRunningProcess = true
    @AppStorage(ProjectLifecyclePreferences.keepOpenWhenNoTabsKey)
    private var keepProjectsOpenWhenNoTabs = false
    @AppStorage(GeneralSettingsKeys.showNavigationArrows)
    private var showNavigationArrows = true
    @AppStorage(SidebarPanelPreferences.rememberPerProjectKey)
    private var rememberSidebarsPerProject = false

    var body: some View {
        SettingsContainer {
            SettingsSection(
                "Sidebar",
                footer: "Automatically reveal worktrees when you switch to a project."
            ) {
                SettingsToggleRow(
                    label: "Auto-expand worktrees on project switch",
                    isOn: $autoExpandWorktrees
                )
            }

            SettingsSection(
                "Side Panels",
                footer: "Remember the show/hide state of the file tree and source control panels independently for each project."
            ) {
                SettingsToggleRow(
                    label: "Remember file tree and source control per project",
                    isOn: $rememberSidebarsPerProject
                )
            }

            SettingsSection(
                "Navigation",
                footer: "Show or hide the back and forward arrow buttons in the top bar."
            ) {
                SettingsToggleRow(
                    label: "Show navigation arrows",
                    isOn: $showNavigationArrows
                )
            }

            SettingsSection(
                "Projects",
                footer: "Keep projects in the sidebar after closing their last tab. "
                    + "To remove a project afterward, use the right-click menu."
            ) {
                SettingsToggleRow(
                    label: "Keep projects open after closing the last tab",
                    isOn: $keepProjectsOpenWhenNoTabs
                )
            }

            SettingsSection("Tabs", showsDivider: false) {
                SettingsToggleRow(
                    label: "Confirm before closing a tab with a running process",
                    isOn: $confirmRunningProcess
                )
            }
        }
    }
}
