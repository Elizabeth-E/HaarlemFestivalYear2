{include file="{$layout}\\header.tpl"}

<h1>Registered Users</h1>

<ul>
{foreach from=$users item=user}
    <li>{$user["username"]}</li>
{/foreach}
</ul>
{include file="{$layout}\\footer.tpl"}