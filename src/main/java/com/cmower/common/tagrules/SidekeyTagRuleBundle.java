package com.cmower.common.tagrules;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

public class SidekeyTagRuleBundle implements TagRuleBundle {
    @Override
    public void install(State defaultState, ContentProperty contentProperty,
            SiteMeshContext siteMeshContext) {
        defaultState.addRule("sidekey", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("sidekey"), false));
        
    }
    
    @Override
    public void cleanUp(State defaultState, ContentProperty contentProperty,
            SiteMeshContext siteMeshContext) {
    }
}
