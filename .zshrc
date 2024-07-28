# auto-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi
zstyle ':completion:*:*:git:*' script ~/git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

PS1='%F{blue}__%1d__%f'

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/danseethaler/Developer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danseethaler/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/danseethaler/Developer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danseethaler/Developer/google-cloud-sdk/completion.zsh.inc'; fi

alias backupFirestoreUsers='gcloud firestore export gs://weekly_firestore_backup --collection-ids=users'
alias backupFirestoreFeedback='gcloud firestore export gs://weekly_firestore_backup --collection-ids=feedback'
alias backupFirestoreSubscriptions='gcloud firestore export gs://weekly_firestore_backup --collection-ids=subscriptions'
alias backupFirestoreSyncCreditPurchases='gcloud firestore export gs://weekly_firestore_backup --collection-ids=syncCreditPurchases'
alias backupFirestoreSyncLogs='gcloud firestore export gs://weekly_firestore_backup --collection-ids=syncLogs'
alias backupFirestore='gcloud firestore export gs://weekly_firestore_backup --collection-ids=accounts,funds,institutions,itemLookups,items,plaidTransactions,syncCreditPurchases,subscriptions,transactions,users,weekInstances'
alias backupFirestoreAllCollections='gcloud firestore export gs://weekly_firestore_backup --collection-ids=accounts,adminDocuments,analytics,dailyBalances,funds,institutions,itemLookups,items,linkTokenRequests,newsletter_emails,plaidTransactions,syncCreditPurchases,recentNotifications,subscriptions,transactions,users,weekConfigs,weekInstances'

alias loadFirestoreToBigQueryUsers='
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_users_table $FOLDER/all_namespaces/kind_users/all_namespaces_kind_users.export_metadata
'

alias loadFirestoreToBigQueryFeedback='
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_feedback_table $FOLDER/all_namespaces/kind_feedback/all_namespaces_kind_feedback.export_metadata
'

alias loadFirestoreToBigQuerySubscriptions='
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_subscriptions_table $FOLDER/all_namespaces/kind_subscriptions/all_namespaces_kind_subscriptions.export_metadata
'

alias loadFirestoreToBigQuerySyncCreditPurchases='
bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_syncCreditPurchases_table $FOLDER/all_namespaces/kind_syncCreditPurchases/all_namespaces_kind_syncCreditPurchases.export_metadata
'

alias loadFirestoreToBigQuerySyncLogs='
bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_syncLogs_table $FOLDER/all_namespaces/kind_syncLogs/all_namespaces_kind_syncLogs.export_metadata
'

alias loadFirestoreToBigQueryAccounts='
bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_accounts_table $FOLDER/all_namespaces/kind_accounts/all_namespaces_kind_accounts.export_metadata
'

alias loadFirestoreToBigQueryTxs='
bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_transactions_table $FOLDER/all_namespaces/kind_transactions/all_namespaces_kind_transactions.export_metadata
'

alias loadFirestoreToBigQuery='
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_users_table $FOLDER/all_namespaces/kind_users/all_namespaces_kind_users.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_weekInstances_table $FOLDER/all_namespaces/kind_weekInstances/all_namespaces_kind_weekInstances.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_transactions_table $FOLDER/all_namespaces/kind_transactions/all_namespaces_kind_transactions.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_subscriptions_table $FOLDER/all_namespaces/kind_subscriptions/all_namespaces_kind_subscriptions.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_funds_table $FOLDER/all_namespaces/kind_funds/all_namespaces_kind_funds.export_metadata &&®
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_institutions_table $FOLDER/all_namespaces/kind_institutions/all_namespaces_kind_institutions.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_plaidTransactions_table $FOLDER/all_namespaces/kind_plaidTransactions/all_namespaces_kind_plaidTransactions.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_syncCreditPurchases_table $FOLDER/all_namespaces/kind_syncCreditPurchases/all_namespaces_kind_syncCreditPurchases.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_accounts_table $FOLDER/all_namespaces/kind_accounts/all_namespaces_kind_accounts.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_items_table $FOLDER/all_namespaces/kind_items/all_namespaces_kind_items.export_metadata &&
  bq load --project_id=weekly-6f36c --replace --source_format=DATASTORE_BACKUP weekly_backups_dataset.weekly_itemLookups_table $FOLDER/all_namespaces/kind_itemLookups/all_namespaces_kind_itemLookups.export_metadata
'

alias src='source ~/.zshrc'
