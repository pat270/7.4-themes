<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
	<@liferay.control_menu />

	<div class="d-flex flex-column flex-fill position-relative" id="wrapper">
		<#if show_header>
			<header id="banner">
				<div class="navbar navbar-classic navbar-top py-3">
					<div class="container-fluid container-fluid-max-xl user-personal-bar">
						<div class="align-items-center autofit-row">
							<a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="" key="go-to-x" />">
								<img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

								<#if show_site_name>
									<h2 class="font-weight-bold h2 mb-0 text-dark" role="heading" aria-level="1">${site_name}</h2>
								</#if>
							</a>

							<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

							<div class="autofit-col autofit-col-expand">
								<#if show_header_search>
									<div class="justify-content-md-end mr-4 navbar-form" role="search">
										<@liferay.search_bar default_preferences="${preferences}" />
									</div>
								</#if>
							</div>

							<div class="autofit-col">
								<@liferay.user_personal_bar />
							</div>
						</div>
					</div>
				</div>

				<div class="navbar navbar-classic navbar-expand-md navbar-light pb-3">
					<div class="container-fluid container-fluid-max-xl">
						<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
							<img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

							<#if show_site_name>
								<h2 class="font-weight-bold h2 mb-0 text-dark">${site_name}</h2>
							</#if>
						</a>

						<#include "${full_templates_path}/navigation.ftl" />
					</div>
				</div>
			</header>
		</#if>

		<section class="${portal_content_css_class} flex-fill" id="content">
			<h2 class="sr-only" role="heading" aria-level="1">${the_title}</h2>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</section>

		<div class="container-fluid container-fluid-max-xl">
			<div>
				<h2>Alert Notification</h2>
				<div class="alert alert-dismissible alert-notification alert-success" role="alert" style="display:inline-block;max-width:22.5rem;">
					<div class="autofit-row alert-autofit-row">
						<div class="autofit-col">
							<div class="autofit-section">
								<span class="alert-indicator">
									<svg class="lexicon-icon lexicon-icon-check-circle-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M471.2,117.7L280.3,340.8c-5.9,6.8-14.6,11.2-24.3,11.2c-8.8,0-16.8-3.6-22.6-9.4l-96-96.1 c-29.1-28.9,16.1-74.2,45.2-45.3l71.6,71.7L423.7,74.8c2.2-2.5,4.7-3.9,7.1-5.5C385,26.5,323.7,0,256,0C114.6,0,0,114.6,0,256 s114.6,256,256,256s256-114.6,256-256C512,205,496.9,157.6,471.2,117.7z"></path></g></svg>
								</span>
							</div>
						</div>
						<div class="autofit-col autofit-col-expand">
							<div class="autofit-section">
								<strong class="lead">Success:</strong> There are new updates available, please refresh the page to view them.
								<div class="alert-footer">
									<div class="btn-group">
										<div class="btn-group-item">
											<button class="btn alert-btn" type="button">Refresh</button>
										</div>
										<div class="btn-group-item">
											<button class="btn btn-secondary btn-sm" data-dismiss="alert" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button aria-label="Close" class="close" data-dismiss="alert" type="button">
						<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
					</button>
				</div>
				<div class="alert alert-dismissible alert-notification alert-info" role="alert" style="display:inline-block;max-width:22.5rem;">
					<div class="autofit-row alert-autofit-row">
						<div class="autofit-col">
							<div class="autofit-section">
								<span class="alert-indicator">
									<svg class="lexicon-icon lexicon-icon-exclamation-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M256,0C114.6,0,0,114.6,0,256s114.6,256,256,256s256-114.6,256-256S397.4,0,256,0z M256,384c-17.7,0-32-14.3-32-32s14.3-32,32-32s32,14.3,32,32S273.7,384,256,384z M272,288h-32l-16-160h64L272,288z"></path></g></svg>
								</span>
							</div>
						</div>
						<div class="autofit-col autofit-col-expand">
							<div class="autofit-section">
								<strong class="lead">Info:</strong> There are new updates available, please refresh the page to view them.
								<div class="alert-footer">
									<div class="btn-group">
										<div class="btn-group-item">
											<button class="btn alert-btn" type="button">Refresh</button>
										</div>
										<div class="btn-group-item">
											<button class="btn btn-secondary btn-sm" data-dismiss="alert" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button aria-label="Close" class="close" data-dismiss="alert" type="button">
						<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
					</button>
				</div>
				<div class="alert alert-dismissible alert-notification alert-warning" role="alert" style="display:inline-block;max-width:22.5rem;">
					<div class="autofit-row alert-autofit-row">
						<div class="autofit-col">
							<div class="autofit-section">
								<span class="alert-indicator">
									<svg class="lexicon-icon lexicon-icon-warning-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M506.3,409.3l-214-353.7c-16.8-30.6-55.8-32.6-72.6,0L5.7,409.3C-8,436.5,5,480,42,480h428C506,480,522.5,436.5,506.3,409.3z M224,392c0-42.5,64-42,64,0C288,433.5,224,434.5,224,392z M288,288c0,42.5-64,40.5-64,0c0-20.4,0-83.6,0-104c0-43,64-43.5,64,0C288,204.4,288,267.6,288,288z"></path></g></svg>
								</span>
							</div>
						</div>
						<div class="autofit-col autofit-col-expand">
							<div class="autofit-section">
								<strong class="lead">Warning:</strong> There are new updates available, please refresh the page to view them.
								<div class="alert-footer">
									<div class="btn-group">
										<div class="btn-group-item">
											<button class="btn alert-btn" type="button">Refresh</button>
										</div>
										<div class="btn-group-item">
											<button class="btn btn-secondary btn-sm" data-dismiss="alert" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button aria-label="Close" class="close" data-dismiss="alert" type="button">
						<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
					</button>
				</div>
				<div class="alert alert-dismissible alert-notification alert-danger" role="alert" style="display:inline-block;max-width:22.5rem;">
					<div class="autofit-row alert-autofit-row">
						<div class="autofit-col">
							<div class="autofit-section">
								<span class="alert-indicator">
									<svg class="lexicon-icon lexicon-icon-exclamation-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M256,0C114.6,0,0,114.6,0,256s114.6,256,256,256s256-114.6,256-256S397.4,0,256,0z M256,384c-17.7,0-32-14.3-32-32s14.3-32,32-32s32,14.3,32,32S273.7,384,256,384z M272,288h-32l-16-160h64L272,288z"></path></g></svg>
								</span>
							</div>
						</div>
						<div class="autofit-col autofit-col-expand">
							<div class="autofit-section">
								<strong class="lead">Danger:</strong> Due to inactivity, your session has expired. Please save any data you may have entered before refreshing the page.
								<div class="alert-footer">
									<div class="btn-group">
										<div class="btn-group-item">
											<button class="btn alert-btn" type="button">Refresh</button>
										</div>
										<div class="btn-group-item">
											<button class="btn btn-secondary btn-sm" data-dismiss="alert" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button aria-label="Close" class="close" data-dismiss="alert" type="button">
						<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
					</button>
				</div>
			</div>
			<div>
				<h2>Badges</h2>
				<span class="badge badge-primary">
					<span class="badge-item badge-item-expand">8</span>
				</span>
				<span class="badge badge-secondary">
					<span class="badge-item badge-item-expand">87</span>
				</span>
				<span class="badge badge-success">
					<span class="badge-item badge-item-expand">999K</span>
				</span>
				<span class="badge badge-info">
					<span class="badge-item badge-item-expand">91</span>
				</span>
				<span class="badge badge-warning">
					<span class="badge-item badge-item-expand">21</span>
				</span>
				<span class="badge badge-danger"><span class="badge-item badge-item-expand">130</span></span>
				<div class="bg-dark d-inline-block"><span class="badge badge-light"><span class="badge-item badge-item-expand">130</span></span></div>
				<span class="badge badge-dark"><span class="badge-item badge-item-expand">130</span></span>
			</div>
			<div>
				<span class="badge badge-primary">
					<span class="badge-item badge-item-expand">Primary</span>
				</span>
				<span class="badge badge-secondary">
					<span class="badge-item badge-item-expand">Secondary</span>
				</span>
				<span class="badge badge-success">
					<span class="badge-item badge-item-expand">Success</span>
				</span>
				<span class="badge badge-info">
					<span class="badge-item badge-item-expand">Info</span>
				</span>
				<span class="badge badge-warning">
					<span class="badge-item badge-item-expand">Warning</span>
				</span>
				<span class="badge badge-danger">
					<span class="badge-item badge-item-expand">Danger</span>
				</span>
				<div class="bg-dark d-inline-block"><span class="badge badge-light"><span class="badge-item badge-item-expand">Light</span></span></div>
				<span class="badge badge-dark"><span class="badge-item badge-item-expand">Dark</span></span>
				<h6>As Anchor Tag</h6>
				<a class="badge badge-primary" href="#1">
					<span class="badge-item badge-item-expand">Primary</span>
				</a>
				<a class="badge badge-secondary" href="#1">
					<span class="badge-item badge-item-expand">Secondary</span>
				</a>
				<a class="badge badge-success" href="#1">
					<span class="badge-item badge-item-expand">Success</span>
				</a>
				<a class="badge badge-info" href="#1">
					<span class="badge-item badge-item-expand">Info</span>
				</a>
				<a class="badge badge-warning" href="#1">
					<span class="badge-item badge-item-expand">Warning</span>
				</a>
				<a class="badge badge-danger" href="#1">
					<span class="badge-item badge-item-expand">Danger</span>
				</a>
				<div class="bg-dark d-inline-block">
					<a class="badge badge-light" href="#1">
						<span class="badge-item badge-item-expand">Light</span>
					</a>
				</div>
				<a class="badge badge-dark" href="#1">
					<span class="badge-item badge-item-expand">Dark</span>
				</a>
			</div>
			<div>
				<h2>Labels</h2>
				<span class="label label-primary">
					<span class="label-item label-item-expand">Primary</span>
				</span>
				<span class="label label-secondary">
					<span class="label-item label-item-expand">Secondary</span>
				</span>
				<span class="label label-success">
					<span class="label-item label-item-expand">Success</span>
				</span>
				<span class="label label-info">
					<span class="label-item label-item-expand">Info</span>
				</span>
				<span class="label label-warning">
					<span class="label-item label-item-expand">Warning</span>
				</span>
				<span class="label label-danger">
					<span class="label-item label-item-expand">Danger</span>
				</span>
				<div class="clay-site-light-container">
					<span class="label label-light">
						<span class="label-item label-item-expand">Light</span>
					</span>
				</div>
				<span class="label label-dark">
					<span class="label-item label-item-expand">Dark</span>
				</span>
				<h6>As Anchor Tag</h6>
				<a class="label label-primary" href="#1">
					<span class="label-item label-item-expand">Primary</span>
				</a>
				<a class="label label-secondary" href="#1">
					<span class="label-item label-item-expand">Secondary</span>
				</a>
				<a class="label label-success" href="#1">
					<span class="label-item label-item-expand">Success</span>
				</a>
				<a class="label label-info" href="#1">
					<span class="label-item label-item-expand">Info</span>
				</a>
				<a class="label label-warning" href="#1">
					<span class="label-item label-item-expand">Warning</span>
				</a>
				<a class="label label-danger" href="#1">
					<span class="label-item label-item-expand">Danger</span>
				</a>
				<span class="bg-dark d-inline-block">
					<a class="label label-light" href="#1">
						<span class="label-item label-item-expand">Light</span>
					</a>
				</span>
				<a class="label label-dark" href="#1">
					<span class="label-item label-item-expand">Dark</span>
				</a>
			</div>
			<div>
				<h2>Label Inverse</h2>
					<span class="label label-inverse-primary">
						<span class="label-item label-item-expand">Primary</span>
					</span>
					<span class="label label-inverse-secondary">
						<span class="label-item label-item-expand">Secondary</span>
					</span>
					<span class="label label-inverse-success">
						<span class="label-item label-item-expand">Success</span>
					</span>
					<span class="label label-inverse-info">
						<span class="label-item label-item-expand">Info</span>
					</span>
					<span class="label label-inverse-warning">
						<span class="label-item label-item-expand">Warning</span>
					</span>
					<span class="label label-inverse-danger">
						<span class="label-item label-item-expand">Danger</span>
					</span>
					<div class="bg-dark d-inline-block">
						<span class="label label-inverse-light">
							<span class="label-item label-item-expand">Light</span>
						</span>
					</div>
					<span class="label label-inverse-dark">
						<span class="label-item label-item-expand">Dark</span>
					</span>
					<h6>As Anchor Tag</h6>
					<a href="#1" class="label label-inverse-primary">
						<span class="label-item label-item-expand">Primary</span>
					</a>
					<a href="#1" class="label label-inverse-secondary">
						<span class="label-item label-item-expand">Secondary</span>
					</a>
					<a href="#1" class="label label-inverse-success">
						<span class="label-item label-item-expand">Success</span>
					</a>
					<a href="#1" class="label label-inverse-info">
						<span class="label-item label-item-expand">Info</span>
					</a>
					<a href="#1" class="label label-inverse-warning">
						<span class="label-item label-item-expand">Warning</span>
					</a>
					<a href="#1" class="label label-inverse-danger">
						<span class="label-item label-item-expand">Danger</span>
					</a>
					<span class="bg-dark d-inline-block">
						<a href="#1" class="label label-inverse-light">
							<span class="label-item label-item-expand">Light</span>
						</a>
					</span>
					<a href="#1" class="label label-inverse-dark">
						<span class="label-item label-item-expand">Dark</span>
					</a>
			</div>
			<div>
				<h2>Stickers</h2>
				<div>
					<span class="sticker sticker-primary">133</span>
					<span class="sticker sticker-secondary">133</span>
					<span class="sticker sticker-success">133</span>
					<span class="sticker sticker-info">133</span>
					<span class="sticker sticker-warning">133</span>
					<span class="sticker sticker-danger">133</span>
					<span class="sticker sticker-light">133</span>
					<span class="sticker sticker-dark">133</span>
				</div>
				<div>
					<span class="sticker sticker-circle sticker-primary">133</span>
					<span class="sticker sticker-circle sticker-secondary">133</span>
					<span class="sticker sticker-circle sticker-success">133</span>
					<span class="sticker sticker-circle sticker-info">133</span>
					<span class="sticker sticker-circle sticker-warning">133</span>
					<span class="sticker sticker-circle sticker-danger">133</span>
					<span class="sticker sticker-circle sticker-light">133</span>
					<span class="sticker sticker-circle sticker-dark">133</span>
				</div>
			</div>
			<div>
				<h2>Breadcrumbs</h2>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a class="breadcrumb-link" href="#1" title="Home">
							<span class="breadcrumb-text-truncate">Home</span>
						</a>
					</li>
					<li class="breadcrumb-item">
						<a class="breadcrumb-link" href="#1" title="Components">
							<span class="breadcrumb-text-truncate">Components</span>
						</a>
					</li>
					<li class="breadcrumb-item">
						<a class="breadcrumb-link" href="#1" title="Breadcrumbs and Paginations">
							<span class="breadcrumb-text-truncate">Breadcrumbs and Paginations</span>
						</a>
					</li>
					<li class="breadcrumb-item">
						<a class="breadcrumb-link" href="#1" title="Page">
							<span class="breadcrumb-text-truncate">Page</span>
						</a>
					</li>
					<li class="breadcrumb-item">
						<a class="breadcrumb-link" href="#1" title="ReallySuperInsanelyJustIncrediblyLongAndTotallyNotPossibleWordButWeAreReallyTryingToCoverAllOurBasesHereJustInCaseSomeoneIsNutsAsPerUsual">
							<span class="breadcrumb-text-truncate">ReallySuperInsanelyJustIncrediblyLongAndTotallyNotPossibleWordButWeAreReallyTryingToCoverAllOurBasesHereJustInCaseSomeoneIsNutsAsPerUsual</span>
						</a>
					</li>
					<li class="active breadcrumb-item">
						<span class="breadcrumb-text-truncate" title="Active">Active</span>
					</li>
				</ol>
			</div>
			<div>
				<h2>Image Cards</h2>
				<ul class="card-page">
					<li class="card-page-item card-page-item-header">
						<h1 class="card-section-header">Group 2</h1>
					</li>
					<li class="card-page-item card-page-item-asset">
						<div class="card-type-asset form-check form-check-card form-check-top-left image-card">
							<div class="card">
								<div class="aspect-ratio bg-checkered card-item-first">
									<div class="custom-control custom-checkbox">
										<label>
											<input class="custom-control-input" type="checkbox">
											<span class="custom-control-label"></span>
											<span class="sticker sticker-bottom-left sticker-danger">JPG</span>
										</label>
									</div>
								</div>
								<div class="card-body">
									<div class="card-row">
										<div class="autofit-col autofit-col-expand">
											<section class="autofit-section">
												<h3 class="card-title" title="thumbnail_coffee.jpg">
													<span class="text-truncate-inline">
														<span class="text-truncate">thumbnail_coffee.jpg</span>
													</span>
												</h3>
												<h3 class="card-title">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">thumbnail_coffee.jpg</a>
													</span>
												</h3>
												<div class="card-title">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">thumbnail_coffee.jpg</a>
													</span>
												</div>
												<p class="card-subtitle" title="Author Action">
													<span class="text-truncate-inline">
														<span class="text-truncate">Author Action</span>
													</span>
												</p>
												<div class="card-subtitle">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">Author Action</a>
													</span>
												</div>
												<div class="card-subtitle">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">Author Action</a>
													</span>
												</div>
												<div class="card-detail">
													<a class="card-link" href="#1">card-link</a>
													&gt;
													<button class="btn btn-unstyled card-link" type="button">button.btn-unstyled.card-link</button>
												</div>
											</section>
										</div>
										<div class="autofit-col">
											<div class="dropdown dropdown-action">
												<a aria-expanded="false" aria-haspopup="true" class="component-action dropdown-toggle" data-toggle="liferay-dropdown" href="#1" role="button">
													<svg class="lexicon-icon lexicon-icon-ellipsis-v" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline ellipsis-v-dot-2" d="M319 255.5c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-3" d="M319 448c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-1" d="M319 64c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path></g></svg>
												</a>
												<ul class="dropdown-menu dropdown-menu-right" style="">
													<li><a class="dropdown-item" href="#1">Download</a></li>
													<li><a class="dropdown-item" href="#1">Edit</a></li>
													<li><a class="dropdown-item" href="#1">Move</a></li>
													<li><a class="dropdown-item" href="#1">Checkout</a></li>
													<li><a class="dropdown-item" href="#1">Permissions</a></li>
													<li><a class="dropdown-item" href="#1">Move to Recycle Bin</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="card-page-item card-page-item-asset">
						<div class="card-type-asset form-check form-check-card form-check-top-left image-card">
							<div class="card">
								<div class="aspect-ratio bg-checkered card-item-first">
									<div class="custom-control custom-checkbox">
										<label>
											<input class="custom-control-input" type="checkbox">
											<span class="custom-control-label"></span>
											<span class="sticker sticker-bottom-left sticker-danger">JPG</span>
										</label>
									</div>
								</div>
								<div class="card-body">
									<div class="card-row">
										<div class="autofit-col autofit-col-expand">
											<section class="autofit-section">
												<h3 class="card-title" title="thumbnail_coffee.jpg">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">thumbnail_coffee.jpg</a>
													</span>
												</h3>
												<p class="card-subtitle" title="Author Action">
													<span class="text-truncate-inline">
														<span class="text-truncate">Author Action</span>
													</span>
												</p>
												<div class="card-detail">
													<span class="label label-success">
														<span class="label-item label-item-expand">Approved</span>
													</span>
												</div>
											</section>
										</div>
										<div class="autofit-col">
											<div class="dropdown dropdown-action">
												<a aria-expanded="false" aria-haspopup="true" class="component-action dropdown-toggle" data-toggle="liferay-dropdown" href="#1" role="button">
													<svg class="lexicon-icon lexicon-icon-ellipsis-v" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline ellipsis-v-dot-2" d="M319 255.5c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-3" d="M319 448c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-1" d="M319 64c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path></g></svg>
												</a>
												<ul class="dropdown-menu dropdown-menu-right" style="">
													<li><a class="dropdown-item" href="#1">Download</a></li>
													<li><a class="dropdown-item" href="#1">Edit</a></li>
													<li><a class="dropdown-item" href="#1">Move</a></li>
													<li><a class="dropdown-item" href="#1">Checkout</a></li>
													<li><a class="dropdown-item" href="#1">Permissions</a></li>
													<li><a class="dropdown-item" href="#1">Move to Recycle Bin</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="card-page-item card-page-item-asset">
						<div class="card-type-asset form-check form-check-card form-check-top-left image-card">
							<div class="card">
								<div class="aspect-ratio bg-checkered card-item-first">
									<div class="custom-control custom-checkbox">
										<label>
											<input class="custom-control-input" type="checkbox">
											<span class="custom-control-label"></span>
											<span class="sticker sticker-bottom-left sticker-danger">JPG</span>
										</label>
									</div>
								</div>
								<div class="card-body">
									<div class="card-row">
										<div class="autofit-col autofit-col-expand">
											<section class="autofit-section">
												<h3 class="card-title" title="thumbnail_coffee.jpg">
													<span class="text-truncate-inline">
														<a class="text-truncate" href="#1">thumbnail_coffee.jpg</a>
													</span>
												</h3>
												<p class="card-subtitle" title="Author Action">
													<span class="text-truncate-inline">
														<span class="text-truncate">Author Action</span>
													</span>
												</p>
												<div class="card-detail">
													<span class="label label-success">
														<span class="label-item label-item-expand">Approved</span>
													</span>
												</div>
											</section>
										</div>
										<div class="autofit-col">
											<div class="dropdown dropdown-action">
												<a aria-expanded="false" aria-haspopup="true" class="component-action dropdown-toggle" data-toggle="liferay-dropdown" href="#1" role="button">
													<svg class="lexicon-icon lexicon-icon-ellipsis-v" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline ellipsis-v-dot-2" d="M319 255.5c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-3" d="M319 448c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-1" d="M319 64c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path></g></svg>
												</a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a class="dropdown-item" href="#1">Download</a></li>
													<li><a class="dropdown-item" href="#1">Edit</a></li>
													<li><a class="dropdown-item" href="#1">Move</a></li>
													<li><a class="dropdown-item" href="#1">Checkout</a></li>
													<li><a class="dropdown-item" href="#1">Permissions</a></li>
													<li><a class="dropdown-item" href="#1">Move to Recycle Bin</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="card-page-item card-page-item-asset">
						<div class="card-type-asset form-check form-check-card form-check-top-left image-card">
							<div class="card">
								<div class="aspect-ratio bg-checkered card-item-first">
									<div class="custom-control custom-checkbox">
										<label>
											<input class="custom-control-input" type="checkbox">
											<span class="custom-control-label"></span>
											<span class="sticker sticker-bottom-left sticker-danger">JPG</span>
										</label>
									</div>
								</div>
								<div class="card-body">
									<div class="card-row">
										<div class="autofit-col autofit-col-expand">
											<h3 class="card-title" title="thumbnail_coffee.jpg">
												<span class="text-truncate-inline">
													<a class="text-truncate" href="#1">thumbnail_coffee.jpg</a>
												</span>
											</h3>
											<p class="card-subtitle" title="Author Action">
												<span class="text-truncate-inline">
													<span class="text-truncate">Author Action</span>
												</span>
											</p>
											<div class="card-detail">
												<span class="label label-success">
													<span class="label-item label-item-expand">Approved</span>
												</span>
											</div>
										</div>
										<div class="autofit-col">
											<div class="dropdown dropdown-action">
												<a aria-expanded="false" aria-haspopup="true" class="component-action dropdown-toggle" data-toggle="liferay-dropdown" href="#1" role="button">
													<svg class="lexicon-icon lexicon-icon-ellipsis-v" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline ellipsis-v-dot-2" d="M319 255.5c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-3" d="M319 448c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path><path class="lexicon-icon-outline ellipsis-v-dot-1" d="M319 64c0 35.346-28.654 64-64 64s-64-28.654-64-64c0-35.346 28.654-64 64-64s64 28.654 64 64z"></path></g></svg>
												</a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a class="dropdown-item" href="#1">Download</a></li>
													<li><a class="dropdown-item" href="#1">Edit</a></li>
													<li><a class="dropdown-item" href="#1">Move</a></li>
													<li><a class="dropdown-item" href="#1">Checkout</a></li>
													<li><a class="dropdown-item" href="#1">Permissions</a></li>
													<li><a class="dropdown-item" href="#1">Move to Recycle Bin</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div>
				<h2>Dropdown Menus</h2>
				<ul aria-labelledby="theDropdownToggleId" class="dropdown-menu" style="display: inline-block;position: static;top: auto;z-index: 0;">
					<li class="dropdown-subheader">Subheader</li>
					<li><a class="active dropdown-item" href="#1" tabindex="-1">Active Class</a></li>
					<li><a class="disabled dropdown-item" href="#1" tabindex="-1">Disabled</a></li>
					<li class="dropdown-divider"></li>
					<li><a class="dropdown-item" role="button" tabindex="0">A Placeholder Link</a></li>
					<li><button class="dropdown-item" type="buton">Button</button></li>
					<li><a class="dropdown-item" href="#1">Link</a></li>
				</ul>
				<ul aria-labelledby="theDropdownToggleId" class="dropdown-menu" style="display:inline-block;position: static;top: auto;z-index: 0;">
					<li class="dropdown-subheader">Order by</li>
					<li>
						<div class="active dropdown-section">
							<div class="custom-control custom-radio">
								<label>
									<input checked class="custom-control-input" id="dropdownRadio1" name="dropdownRadio" type="radio">
									<span class="custom-control-label">
										<span class="custom-control-label-text">Selected Option</span>
									</span>
								</label>
							</div>
						</div>
					</li>
					<li>
						<div class="dropdown-section">
							<div class="custom-control custom-radio">
								<label>
									<input class="custom-control-input" id="dropdownRadio2" name="dropdownRadio" type="radio">
									<span class="custom-control-label">
										<span class="custom-control-label-text">Normal Option</span>
									</span>
								</label>
							</div>
						</div>
					</li>
					<li>
						<div class="disabled dropdown-section">
							<div class="custom-control custom-radio">
								<label>
									<input disabled class="custom-control-input" id="dropdownRadio3" name="dropdownRadio" type="radio">
									<span class="custom-control-label">
										<span class="custom-control-label-text">Disabled Option</span>
									</span>
								</label>
							</div>
						</div>
					</li>
					<li class="dropdown-section">
						<button class="btn btn-block btn-primary" type="submit">Done</button>
					</li>
				</ul>
				<ul aria-labelledby="theDropdownToggleId" class="dropdown-menu" style="display:inline-block;position: static;top: auto;z-index: 0;">
					<li class="dropdown-section form-group">
						<label for="basicInputTypeText1">
							Text 1
						</label>
						<input class="form-control form-control-sm" id="basicInputTypeText1" placeholder="Placeholder" type="text">
					</li>
					<li class="dropdown-subheader">Form Section</li>
					<li class="dropdown-section">
						<div class="form-group">
							<label for="basicInputTypeText2">
								Text 2
							</label>
							<input class="form-control form-control-sm" id="basicInputTypeText2" placeholder="Placeholder" type="text">
						</div>
					</li>
					<li class="dropdown-section">
						<div class="form-group">
							<label for="basicInputTypeText3">
								Text 3
							</label>
							<input class="form-control form-control-sm" id="basicInputTypeText3" placeholder="Placeholder" type="text">
						</div>
						<div class="form-group">
							<label for="basicInputTypeTextarea">Textarea</label>
							<textarea class="form-control form-control-sm" id="basicInputTypeTextarea" placeholder="Placeholder"></textarea>
						</div>
					</li>
					<li class="dropdown-subheader">Order by</li>
					<li><a class="active dropdown-item" href="#1" tabindex="-1">Author</a></li>
					<li><a class="disabled dropdown-item" href="#1" tabindex="-1">Title Entry</a></li>
					<li class="dropdown-section">
						<button class="btn btn-block btn-secondary" type="submit">Done</button>
					</li>
				</ul>
			</div>
			<div style="clear: left;">
				<h2>Modals</h2>
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-item-group">
								<div class="modal-item">
									<div class="modal-title-section">
										<div class="modal-title" id="clayDefaultModalLabel">Modal Title</div>
									</div>
								</div>
							</div>
							<button aria-label="Close" class="close" data-dismiss="modal" type="button">
								<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
							</button>
						</div>
						<div class="modal-body">
							<h4>Modal Body</h4>
						</div>
						<div class="modal-footer">
							<div class="modal-item-last">
								<div class="btn-group">
									<div class="btn-group-item">
										<button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
									</div>
									<div class="btn-group-item">
										<button class="btn btn-primary" type="button">Primary</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-danger modal-dialog modal-full-screen-sm-down">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-item-group">
								<div class="modal-item">
									<div class="modal-title-section">
										<div class="modal-title" id="clayModalDangerLabel">
											<span class="modal-title-indicator">
												<svg class="lexicon-icon lexicon-icon-exclamation-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M256,0C114.6,0,0,114.6,0,256s114.6,256,256,256s256-114.6,256-256S397.4,0,256,0z M256,384c-17.7,0-32-14.3-32-32s14.3-32,32-32s32,14.3,32,32S273.7,384,256,384z M272,288h-32l-16-160h64L272,288z"></path></g></svg>
											</span>
											Modal Title
										</div>
									</div>
								</div>
								<div class="modal-item modal-item-shrink">
									<div class="modal-subtitle-section">
										<div class="text-truncate-inline">
											<div class="text-truncate">
												<div class="modal-subtitle">Step 1 of 2</div>
												<div class="modal-subtitle-divider">/</div>
												<strong>Details</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button aria-label="Close" class="close" data-dismiss="modal" type="button">
								<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
							</button>
						</div>
						<div class="modal-body">
							<h4>Modal Body</h4>
						</div>
						<div class="modal-footer">
							<div class="modal-item-first">
								<button class="btn btn-primary" type="button">Primary</button>
							</div>
							<div class="modal-item">Some other content</div>
							<div class="modal-item-last">
								<div class="modal-item-last">
									<div class="btn-group">
										<div class="btn-group-item">
											<button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
										</div>
										<div class="btn-group-item">
											<button class="btn btn-primary" type="button">Primary</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-info modal-dialog modal-full-screen-sm-down">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-label="Close" class="close" data-dismiss="modal" type="button">
								<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
							</button>
							<div class="modal-item-group">
								<div class="modal-item">
									<div class="modal-title-section">
										<div class="modal-title" id="clayModalInfoLabel">
											<span class="modal-title-indicator">
												<svg class="lexicon-icon lexicon-icon-info-circle" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M437,75C388.7,26.6,324.4,0,256,0C187.6,0,123.3,26.6,75,75C26.6,123.3,0,187.6,0,256c0,68.4,26.6,132.7,75,181c48.4,48.4,112.6,75,181,75c68.4,0,132.7-26.6,181-75c48.4-48.4,75-112.6,75-181C512,187.6,485.4,123.3,437,75z M288,384c0,17.7-14.3,32-32,32c-17.7,0-32-14.3-32-32V224c0-17.7,14.3-32,32-32c17.7,0,32,14.3,32,32V384z M256,160c-17.7,0-32-14.3-32-32c0-17.7,14.3-32,32-32s32,14.3,32,32C288,145.7,273.7,160,256,160z"></path></g></svg>
											</span>
											ReallySuperInsanelyJustIncrediblyLongAndTotallyNotPossibleWordButWeAreReallyTryingToCoverAllOurBasesHereJustInCaseSomeoneIsNutsAsPerUsual
										</div>
									</div>
								</div>
								<div class="modal-item modal-item-shrink">
									<div class="modal-subtitle-section">
										<div class="text-truncate-inline">
											<div class="text-truncate">
												<span class="modal-subtitle">Step 10,000,000,000 of 2,000,000,000,000,000</span>
												<span class="modal-subtitle-divider">/</span>
												<strong>Details</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-body">
							<h4>Modal Body</h4>
						</div>
						<div class="modal-footer">
							<div class="modal-item-last">
								<div class="btn-group">
									<div class="btn-group-item">
										<button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
									</div>
									<div class="btn-group-item">
										<button class="btn btn-primary" type="button">Primary</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-success modal-dialog modal-full-screen-sm-down">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-item-group">
								<div class="modal-item">
									<div class="modal-title-section">
										<div class="modal-title" id="clayModalSuccessLabel">
											<span class="modal-title-indicator">
												<svg class="lexicon-icon lexicon-icon-check-circle-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M471.2,117.7L280.3,340.8c-5.9,6.8-14.6,11.2-24.3,11.2c-8.8,0-16.8-3.6-22.6-9.4l-96-96.1 c-29.1-28.9,16.1-74.2,45.2-45.3l71.6,71.7L423.7,74.8c2.2-2.5,4.7-3.9,7.1-5.5C385,26.5,323.7,0,256,0C114.6,0,0,114.6,0,256 s114.6,256,256,256s256-114.6,256-256C512,205,496.9,157.6,471.2,117.7z"></path></g></svg>
											</span>
											Modal Title
										</div>
									</div>
								</div>
							</div>
							<button aria-label="Close" class="close" data-dismiss="modal" type="button">
								<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
							</button>
						</div>
						<div class="modal-body">
							<h4>Modal Body</h4>
						</div>
						<div class="modal-footer">
							<div class="modal-item-first">
								<button class="btn btn-primary" type="button">Primary</button>
							</div>
							<div class="modal-item-last">
								<div class="btn-group">
									<div class="btn-group-item">
										<button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
									</div>
									<div class="btn-group-item">
										<button class="btn btn-primary" type="button">Primary</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-warning modal-dialog modal-full-screen-sm-down">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-item-group">
								<div class="modal-item">
									<div class="modal-title-section">
										<div class="modal-title" id="clayModalWarningLabel">
											<span class="modal-title-indicator">
												<svg class="lexicon-icon lexicon-icon-warning-full" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M506.3,409.3l-214-353.7c-16.8-30.6-55.8-32.6-72.6,0L5.7,409.3C-8,436.5,5,480,42,480h428C506,480,522.5,436.5,506.3,409.3z M224,392c0-42.5,64-42,64,0C288,433.5,224,434.5,224,392z M288,288c0,42.5-64,40.5-64,0c0-20.4,0-83.6,0-104c0-43,64-43.5,64,0C288,204.4,288,267.6,288,288z"></path></g></svg>
											</span>
											Modal Title
										</div>
									</div>
								</div>
							</div>
							<button aria-label="Close" class="close" data-dismiss="modal" type="button">
								<svg class="lexicon-icon lexicon-icon-times" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M300.4,256L467,89.4c29.6-29.6-14.8-74.1-44.4-44.4L256,211.6L89.4,45C59.8,15.3,15.3,59.8,45,89.4L211.6,256L45,422.6 c-29.7,29.7,14.7,74.1,44.4,44.4L256,300.4L422.6,467c29.7,29.7,74.1-14.7,44.4-44.4L300.4,256z"></path></g></svg>
							</button>
						</div>
						<div class="modal-body">
							<h4>Modal Body</h4>
						</div>
						<div class="modal-footer">
							<div class="modal-item-last">
								<div class="btn-group">
									<div class="btn-group-item">
										<button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
									</div>
									<div class="btn-group-item">
										<button class="btn btn-primary" type="button">Primary</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<h2>Popovers</h2>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-top fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover top</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-top-left fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Top Left</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-top-right fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Top Right</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<h6>Clay Popover Right</h6>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-right fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Right</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-right-top fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Right Top</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-right-bottom fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Right Bottom</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<h6>Clay Popover Bottom</h6>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-bottom fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Bottom</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-bottom-left fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Bottom Left</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-bottom-right fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Bottom Right</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<h6>Clay Popover Left</h6>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-left fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Left</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-left-top fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Left Top</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
				<div style="display: inline-block;height: 240px;position: relative;width: 250px;">
					<div class="clay-popover-left-bottom fade popover show">
						<div class="arrow"></div>
						<div class="inline-scroller">
							<div class="popover-header">Popover Left Bottom</div>
							<div class="popover-body">
								Viennese flavour cup eu, percolator froth ristretto mazagran caffeine. White roast seasonal, mocha trifecta, dripper caffeine spoon acerbic to go macchiato strong.
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<h2>Tooltips</h2>
				<h6>Clay Tooltip Right</h6>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-right show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the right</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-right-top show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the right top</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-right-bottom show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the right bottom</div></div>
					</div>
				</div>

				<h6>Clay Tooltip Left</h6>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-left show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the left</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-left-top show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the left top</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-left-bottom show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the left bottom</div></div>
					</div>
				</div>

				<h6>Clay Tooltip Bottom</h6>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-bottom show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the bottom</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-bottom-left show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the bottom left</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-bottom-right show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the bottom right</div></div>
					</div>
				</div>

				<h6>Clay Tooltip Top</h6>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-top show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the top</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-top-left show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the top left</div></div>
					</div>
				</div>
				<div style="display: inline-block;height: 100px;position: relative;width: 250px;">
					<div class="fade tooltip clay-tooltip-top-right show" role="tooltip">
						<div class="arrow"></div>
						<div class="tooltip-inner"><div>Tooltip on the top right</div></div>
					</div>
				</div>
			</div>
			<div>
				<h2>Pagination</h2>
				<ul class="pagination">
					<li class="disabled page-item">
						<a class="page-link" href="#1" role="button" tabindex="-1">
							<svg class="lexicon-icon lexicon-icon-angle-left" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M136.8,272.8l201.7,202.1c23.5,23.1,60-11.6,36.1-35.2L191.7,256l183-183.9c23.9-23.2-12.5-58.1-36-35.1L136.8,239.2C127.5,248.5,126.6,262.8,136.8,272.8z"></path></g></svg><span class="sr-only">Previous</span>
						</a>
					</li>
					<li class="active page-item"><a class="page-link" href="#1" tabindex="-1">1</a></li>
					<li class="page-item"><a class="page-link" href="#1">2</a></li>
					<li class="page-item"><a class="page-link" href="#1">3</a></li>
					<li class="page-item"><a class="page-link" href="#1">4</a></li>
					<li class="page-item"><a class="page-link" href="#1">5</a></li>
					<li class="page-item"><a class="page-link" href="#1">6</a></li>
					<li class="page-item"><a class="page-link" href="#1">7</a></li>
					<li class="page-item"><a class="page-link" href="#1">8</a></li>
					<li class="page-item"><a class="page-link" href="#1">9</a></li>
					<li class="page-item"><a class="page-link" href="#1">10</a></li>
					<li class="dropdown page-item">
						<a aria-expanded="false" aria-haspopup="true" class="dropdown-toggle page-link" data-toggle="liferay-dropdown" href="#1" role="button">...</a>
						<ul class="dropdown-menu dropdown-menu-top-center">
							<li>
								<ul class="inline-scroller">
									<li><a class="dropdown-item" href="#1">11</a></li>
									<li><a class="dropdown-item" href="#1">12</a></li>
									<li><a class="dropdown-item" href="#1">13</a></li>
									<li><a class="dropdown-item" href="#1">14</a></li>
									<li><a class="dropdown-item" href="#1">15</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="page-item"><a class="page-link" href="#1">16</a></li>
					<li class="page-item">
						<a class="page-link" href="#1" role="button">
							<svg class="lexicon-icon lexicon-icon-angle-right" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M375.2,239.2L173.3,37c-23.6-23-59.9,11.9-36,35.1l183,183.9L137.4,439.8c-24,23.5,12.5,58.2,36.1,35.2l201.7-202.1C385.4,262.8,384.5,248.5,375.2,239.2z"></path></g></svg>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
				<h2>Pagination Bar</h2>
				<div class="pagination-bar">
					<div class="dropdown pagination-items-per-page">
						<a aria-expanded="false" aria-haspopup="true" class="dropdown-toggle" data-toggle="dropdown" href="#1" role="button">
							10 entries<svg class="lexicon-icon lexicon-icon-caret-double-l" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline caret-double-l-top" d="M347.913 199.336l-81.538-85c-5.413-5.642-14.188-5.642-19.6 0l-81.538 85c-8.731 9.101-2.548 24.664 9.8 24.664h163.077c12.348 0 18.531-15.563 9.8-24.664z"></path><path class="lexicon-icon-outline caret-double-l-bottom" d="M165.236 312.664l81.538 85c5.412 5.642 14.188 5.642 19.6 0l81.538-85c8.731-9.101 2.548-24.664-9.8-24.664h-163.077c-12.347 0-18.531 15.563-9.8 24.664z"></path></g></svg>
						</a>
						<ul class="dropdown-menu dropdown-menu-top">
							<li><a class="dropdown-item" href="#1">5</a></li>
							<li><a class="dropdown-item" href="#1">10</a></li>
							<li><a class="dropdown-item" href="#1">20</a></li>
							<li><a class="dropdown-item" href="#1">30</a></li>
							<li><a class="dropdown-item" href="#1">50</a></li>
						</ul>
					</div>
					<div class="pagination-results">Showing 1 to 20 of 203 entries.</div>
					<ul class="pagination">
						<li class="disabled page-item">
							<a class="page-link" href="#1" role="button" tabindex="-1">
								<svg class="lexicon-icon lexicon-icon-angle-left" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M136.8,272.8l201.7,202.1c23.5,23.1,60-11.6,36.1-35.2L191.7,256l183-183.9c23.9-23.2-12.5-58.1-36-35.1L136.8,239.2C127.5,248.5,126.6,262.8,136.8,272.8z"></path></g></svg><span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="active page-item"><a class="page-link" href="#1" tabindex="-1">1</a></li>
						<li class="page-item"><a class="page-link" href="#1">2</a></li>
						<li class="dropdown page-item">
							<a aria-expanded="false" aria-haspopup="true" class="dropdown-toggle page-link" data-toggle="liferay-dropdown" href="#1" role="button">...</a>
							<ul class="dropdown-menu dropdown-menu-top-center" style="">
								<li>
									<ul class="inline-scroller">
										<li><a class="dropdown-item" href="#1">3</a></li>
										<li><a class="dropdown-item" href="#1">4</a></li>
										<li><a class="dropdown-item" href="#1">5</a></li>
										<li><a class="dropdown-item" href="#1">6</a></li>
										<li><a class="dropdown-item" href="#1">7</a></li>
										<li><a class="dropdown-item" href="#1">8</a></li>
										<li><a class="dropdown-item" href="#1">9</a></li>
										<li><a class="dropdown-item" href="#1">10</a></li>
										<li><a class="dropdown-item" href="#1">11</a></li>
										<li><a class="dropdown-item" href="#1">12</a></li>
										<li><a class="dropdown-item" href="#1">13</a></li>
										<li><a class="dropdown-item" href="#1">14</a></li>
										<li><a class="dropdown-item" href="#1">15</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="page-item"><a class="page-link" href="#1">16</a></li>
						<li class="page-item">
							<a class="page-link" href="#1" role="button">
								<svg class="lexicon-icon lexicon-icon-angle-right" focusable="false" role="presentation" viewBox="0 0 512 512"><g><path class="lexicon-icon-outline" d="M375.2,239.2L173.3,37c-23.6-23-59.9,11.9-36,35.1l183,183.9L137.4,439.8c-24,23.5,12.5,58.2,36.1,35.2l201.7-202.1C385.4,262.8,384.5,248.5,375.2,239.2z"></path></g></svg><span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</div>
			</div>




		</div>


		<#if show_footer>
			<footer id="footer" role="contentinfo">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center text-md-left">
							<@liferay.language_format
								arguments='<a class="text-white" href="http://www.liferay.com" rel="external">Liferay</a>'
								key="powered-by-x"
							/>
						</div>
					</div>
				</div>
			</footer>
		</#if>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>